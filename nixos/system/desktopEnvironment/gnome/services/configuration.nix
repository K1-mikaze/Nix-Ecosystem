{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop_environment.gnome.services.configuration.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop_environment.gnome.services.configuration.enable {
    specialisation = {
      wireless-screen = {
        configuration = {
          services.gnome.gnome-remote-desktop.enable = true;
          systemd.services.gnome-remote-desktop = {
            wantedBy = ["graphical.target"];
          };

          networking.firewall.allowedTCPPorts = [3389];

          programs.dconf = {
            profiles.user.databases = [
              {
                settings = {
                  "org/gnome/desktop/remote-desktop" = {
                    enable = true;
                  };

                  "org/gnome/desktop/remote-desktop/rdp" = {
                    enable = true;
                    view-only = true;
                    screen-share-mode = "extend";
                  };
                };
              }
            ];
          };
        };
      };
    };

    services.gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = false;
      games.enable = false;
      gnome-keyring.enable = true;
    };

    security.pam = {
      services.sudo.fprintAuth = false;
      services.gdm-fingerprint.fprintAuth = true;
      services.gdm.enableGnomeKeyring = true;
    };

    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      power-profiles-daemon.enable = true;
      fprintd.enable = true;
    };

    programs.dconf = {
      profiles.user.databases = [
        {
          lockAll = true;
          settings = {
            "org/gnome/desktop/interface" = {
              accent-color = "purple";
            };
            "org/gnome/desktop/input-sources" = {
              xkb-options = ["caps:escape"];
              sources = [(pkgs.lib.gvariant.mkTuple ["xkb" "latam"])];
            };
          };
        }
      ];
    };
  };
}
