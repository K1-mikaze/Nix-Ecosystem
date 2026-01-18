{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop_environment.gnome.custom.keymaps.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop_environment.gnome.custom.keymaps.enable {
    programs.dconf = {
      profiles.user.databases = [
        {
          lockAll = true;
          settings = {
            "org/gnome/settings-daemon/plugins/media-keys" = {
              custom-keybindings = [
                "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
              ];
            };
            "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
              name = "Open terminal";
              command = "foot";
              binding = "<Super>t";
            };

            "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
              name = "Open the Web browser";
              command = "brave";
              binding = "<Super>b";
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
