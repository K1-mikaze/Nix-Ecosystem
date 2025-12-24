{
  config,
  pkgs,
  lib,
  ...
}: let
  pluginPkgs = with pkgs.hyprlandPlugins; [
    hyprexpo
    hyprspace
  ];
  hyprPluginDir = pkgs.symlinkJoin {
    name = "hyprland-plugins";
    paths = pluginPkgs;
  };
in {
  options.system.desktop_environment.hyprland.enable = lib.mkEnableOption "Enable Hyprland Desktop Enviroment";

  config = lib.mkIf config.system.desktop_environment.hyprland.enable {
    environment.systemPackages = with pkgs; [
      xfce.thunar
      mpv
      foot
      hyprpaper
      wl-clipboard
      lm_sensors
      openssh
    ];
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    services.power-profiles-daemon.enable = true;

    programs.light.enable = true; # Control over background light in screen

    services = {
      dbus.enable = true;
      gvfs.enable = true;
      blueman.enable = true;
    };

    hardware.bluetooth.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
      ];
    };

    security.polkit.enable = true;

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --sessions ${pkgs.hyprland}/share/wayland-sessions";
          user = "greeter";
        };
      };
    };
    systemd.services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal"; # Without this errors will spam on screen
      # Without these bootlogs will spam on screen
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };

    environment.sessionVariables = {
      HYPR_PLUGIN_DIR = hyprPluginDir;
    };
  };
}
