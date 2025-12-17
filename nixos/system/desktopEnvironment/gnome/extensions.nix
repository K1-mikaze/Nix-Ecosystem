{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop_environment.gnome.extensions.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop_environment.gnome.extensions.enable {
    environment.systemPackages = with pkgs.gnomeExtensions; [
      clipboard-indicator
      removable-drive-menu
      privacy-settings-menu
      just-perfection
      cronomix
      blur-my-shell
      # transparent-top-bar-adjustable-transparency
    ];

    programs.dconf = {
      profiles.user.databases = [
        {
          lockAll = true;
          settings = {
            "org/gnome/shell" = {
              enabled-extensions = with pkgs.gnomeExtensions; [
                clipboard-indicator.extensionUuid
                removable-drive-menu.extensionUuid
                privacy-settings-menu.extensionUuid
                just-perfection.extensionUuid
                cronomix.extensionUuid
                # transparent-top-bar-adjustable-transparency.extensionUuid
                blur-my-shell.extensionUuid
              ];
            };
          };
        }
      ];
    };
  };
}
