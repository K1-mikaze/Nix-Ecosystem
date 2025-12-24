{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop_environment.gnome.extensions.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop_environment.gnome.extensions.enable {
    environment.systemPackages = with pkgs.gnomeExtensions; [
      tactile
      clipboard-indicator
      removable-drive-menu
      just-perfection
      blur-my-shell
      caffeine
      cronomix
      transparent-top-bar-adjustable-transparency
    ];

    programs.dconf = {
      profiles.user.databases = [
        {
          lockAll = true;
          settings = {
            "org/gnome/shell" = {
              enabled-extensions = with pkgs.gnomeExtensions; [
                tactile.extensionUuid
                caffeine.extensionUuid
                clipboard-indicator.extensionUuid
                removable-drive-menu.extensionUuid
                just-perfection.extensionUuid
                blur-my-shell.extensionUuid
                cronomix.extensionUuid
                transparent-top-bar-adjustable-transparency.extensionUuid
              ];
            };
          };
        }
      ];
    };
  };
}
