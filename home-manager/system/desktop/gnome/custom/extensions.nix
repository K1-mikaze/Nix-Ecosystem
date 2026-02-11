{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}: {
  options.system.desktop.gnome.custom.extensions.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop.gnome.custom.extensions.enable {
    home.packages = with pkgs.gnomeExtensions; [
      removable-drive-menu
      touchpad-switcher
      app-name-indicator
      caffeine
      just-perfection
      quick-settings-audio-panel
      gsconnect
      transparent-top-bar-adjustable-transparency
      top-panel-logo
      paperwm
      battery-health-charging
    ];

    dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = with pkgs.gnomeExtensions; [
            removable-drive-menu.extensionUuid
            touchpad-switcher.extensionUuid
            app-name-indicator.extensionUuid
            caffeine.extensionUuid
            just-perfection.extensionUuid
            quick-settings-audio-panel.extensionUuid
            gsconnect.extensionUuid
            transparent-top-bar-adjustable-transparency.extensionUuid
            top-panel-logo.extensionUuid
            paperwm.extensionUuid
            battery-health-charging.extensionUuid
          ];
        };
      };
    };
  };
}
