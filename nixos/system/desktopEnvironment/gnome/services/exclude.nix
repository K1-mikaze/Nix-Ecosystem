{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop_environment.gnome.services.exclude.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop_environment.gnome.services.exclude.enable {
    environment.gnome.excludePackages = with pkgs; [
      baobab # disk usage analyzer
      cheese # photo booth
      epiphany # web browser
      # gedit # text editor#
      simple-scan # document scanner
      yelp # help viewer
      evince # document viewer
      file-roller # archive manager
      geary # email client

      gnome-characters
      gnome-clocks
      gnome-contacts
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-photos
      gnome-screenshot
      gnome-system-monitor
      gnome-weather
      gnome-disk-utility
      gnome-connections
      gnome-terminal
      gnome-text-editor
      gnome-tour
      gnome-console
    ];
    services.xserver.excludePackages = with pkgs; [xterm];
  };
}
