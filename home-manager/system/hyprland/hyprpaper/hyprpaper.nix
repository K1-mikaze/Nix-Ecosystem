{
  config,
  lib,
  ...
}: {
  options.system.hyprland.wallpaper.enable = lib.mkEnableOption "Enables Calcurse calendar in hyperland";

  config = lib.mkIf config.system.hyprland.wallpaper.enable {
    home.file.".config/hypr/hyprpaper.conf".source = ../configFiles/hyprpaper.conf;
  };
}
