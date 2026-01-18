{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop_environment.gnome.custom.extensions.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop_environment.gnome.custom.extensions.enable {
    environment.systemPackages = with pkgs.gnomeExtensions; [
      user-themes
      blur-my-shell
      removable-drive-menu
      touchpad-switcher
      tactile
    ];

    programs.dconf = {
      profiles.user.databases = [
        {
          lockAll = true;
          settings = {
            "org/gnome/shell" = {
              enabled-extensions = with pkgs.gnomeExtensions; [
                user-themes.extensionUuid
                blur-my-shell.extensionUuid
                touchpad-switcher.extensionUuid
                removable-drive-menu.extensionUuid
                tactile.extensionUuid
              ];
            };

            "org/gnome/shell/extensions/user-theme" = {
              name = "Dracula";
            };
          };
        }
      ];
    };
  };
}
