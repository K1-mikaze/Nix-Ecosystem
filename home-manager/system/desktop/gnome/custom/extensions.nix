{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop.gnome.custom.extensions.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop.gnome.custom.extensions.enable {
    home.packages = [
      pkgs.gnomeExtensions.removable-drive-menu
      pkgs.gnomeExtensions.touchpad-switcher
      pkgs.gnomeExtensions.tactile
      pkgs.gnomeExtensions.app-name-indicator
      pkgs.gnomeExtensions.auto-move-windows
      pkgs.gnomeExtensions.caffeine
      pkgs.gnomeExtensions.dynamic-panel
    ];

    dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            pkgs.gnomeExtensions.removable-drive-menu.extensionUuid
            pkgs.gnomeExtensions.touchpad-switcher.extensionUuid
            pkgs.gnomeExtensions.tactile.extensionUuid
            pkgs.gnomeExtensions.app-name-indicator.extensionUuid
            pkgs.gnomeExtensions.auto-move-windows.extensionUuid
            pkgs.gnomeExtensions.caffeine.extensionUuid
            pkgs.gnomeExtensions.dynamic-panel.extensionUuid
          ];
        };
      };
    };
  };
}
