{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}: {
  options.system.desktop.gnome.custom.extensions.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop.gnome.custom.extensions.enable {
    home.packages = [
      pkgs.gnomeExtensions.user-themes
      pkgs.gnomeExtensions.blur-my-shell
      pkgs.gnomeExtensions.removable-drive-menu
      pkgs.gnomeExtensions.touchpad-switcher
      pkgs.gnomeExtensions.tactile
      pkgs.gnomeExtensions.app-name-indicator
      pkgs.gnomeExtensions.auto-move-windows
      pkgs-unstable.gnomeExtensions.cronomix
    ];

    dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            pkgs.gnomeExtensions.user-themes.extensionUuid
            pkgs.gnomeExtensions.auto-move-windows.extensionUuid
            pkgs.gnomeExtensions.blur-my-shell.extensionUuid
            pkgs.gnomeExtensions.touchpad-switcher.extensionUuid
            pkgs.gnomeExtensions.removable-drive-menu.extensionUuid
            pkgs.gnomeExtensions.app-name-indicator.extensionUuid
            pkgs.gnomeExtensions.tactile.extensionUuid
            pkgs-unstable.gnomeExtensions.cronomix.extensionUuid
          ];
        };
      };
    };
  };
}
