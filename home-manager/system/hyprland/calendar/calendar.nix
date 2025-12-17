{
  config,
  lib,
  pkgs,
  ...
}: let
  googleUser = "sergioidarraga2110@gmail.com";
  clientId = "42187127283-8vvufbmvcagclna1ifsvev9adut1gdko.apps.googleusercontent.com";
  clientSecret = "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";
  calendarFile = "${config.home.homeDirectory}/.calendars/sergioidarraga2110@gmail.com";
in {
  options.system.hyprland.calendar.enable = lib.mkEnableOption "Enables Calcurse calendar in hyperland";

  config = lib.mkIf config.system.hyprland.calendar.enable {
    home.packages = with pkgs; [
      vdirsyncer
      calcurse
    ];

    # vdirsyncer configuration
    xdg.configFile."vdirsyncer/config".text = ''
      [general]
      status_path = "${config.xdg.dataHome}/vdirsyncer/status/"

      [pair calcurse_sync]
      a = "google_calendar"
      b = "local_calendar"
      collections = ["from a", "from b"]
      metadata = "color"

      [storage local_calendar]
      type = "singlefile"
      path = "${config.home.homeDirectory}/.calendars/%s/"

      [storage google_calendar]
      type = "google_calendar"
      token_file = "${config.xdg.dataHome}/vdirsyncer/google_token"
      client_id = "${clientId}"
      client_secret = "${clientSecret}"
    '';

    # Sync script (run before/after calcurse)
    home.file.".calcurse-sync" = {
      source = pkgs.writeScript "calcurse-sync" ''
        #!/bin/sh
        vdirsyncer sync

        rm ${config.xdg.dataHome}/calcurse/apts
        touch ${config.xdg.dataHome}/calcurse/apts
        calcurse -i ${calendarFile}

        vdirsyncer sync
      '';
      executable = true;
    };

    # Automatic background sync service
    systemd.user = {
      services.calcurse-sync = {
        Unit = {
          Description = "Calcurse calendar synchronization";
          After = ["network-online.target"];
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${config.home.homeDirectory}/.calcurse-sync"; # ← Fixed path
          Environment = "PATH=${lib.makeBinPath [
            pkgs.vdirsyncer
            pkgs.calcurse
            pkgs.libnotify
            pkgs.gnused
            pkgs.gnugrep
            pkgs.coreutils # for date, etc.
          ]}";
          SuccessExitStatus = "0 1";
        };
      };

      timers.calcurse-sync = {
        Unit.Description = "Timer for Calcurse synchronization";
        Timer = {
          OnBootSec = "1m";
          OnUnitActiveSec = "60m";
          AccuracySec = "1m";
          Persistent = true;
        };
        Install.WantedBy = ["timers.target"];
      };
    };

    # Enable user services (required for NixOS)
    systemd.user.startServices = "sd-switch"; # Or "legacy" if on older NixOS
  };
}
