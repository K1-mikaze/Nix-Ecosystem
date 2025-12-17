{
  pkgs,
  lib,
  config,
  ...
}: {
  options.system.hyprland.screenshots.enable = lib.mkEnableOption "Enables Calcurse calendar in hyperland";

  config = lib.mkIf config.system.hyprland.screenshots.enable {
    home.packages = with pkgs; [hyprshot];
    home.file.".config/hypr/hyprshot.conf".source = ../configFiles/hyprshot.conf;
  };
}
