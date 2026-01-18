{
  config,
  lib,
  ...
}: {
  options.system.desktop_environment.gnome.custom.theme.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop_environment.gnome.custom.theme.enable {
    programs.dconf = {
      profiles.user.databases = [
        {
          lockAll = true;
          settings = {
            "org/gnome/desktop/interface" = {
              accent-color = "purple";
              color-scheme = "prefer-dark";
            };

            "org/gnome/shell/extensions/user-theme" = {
              name = "Dracula";
            };

            "org/gnome/desktop/background" = {
              picture-uri-dark = "file://${../../../../../assets/rose-pine-nix.webp}";
              picture-options = "center";
              color-shading-type = "solid";
            };
          };
        }
      ];
    };
  };
}
