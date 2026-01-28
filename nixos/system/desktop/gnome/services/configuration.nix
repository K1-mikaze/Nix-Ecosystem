{
  config,
  lib,
  ...
}: {
  options.system.desktop.gnome.services.configuration.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop.gnome.services.configuration.enable {
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
      gnome = {
        core-apps.enable = true;
        core-developer-tools.enable = false;
        games.enable = false;
        gnome-keyring.enable = true;
      };
    };
  };
}
