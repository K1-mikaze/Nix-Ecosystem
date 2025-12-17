{
  pkgs,
  lib,
  config,
  ...
}: {
  options.system.hyprland.app-launcher.enable = lib.mkEnableOption "Enables Calcurse calendar in hyperland";

  config = lib.mkIf config.system.hyprland.app-launcher.enable {
    home.file.".config/rofi/config.rasi".source = ../configFiles/config.rasi;

    home.packages = with pkgs; [rofi-wayland];

    home.file.".rofi-wifi-menu" = {
      source = ../configFiles/rofi-wifi-menu.sh;
      executable = true;
    };

    home.file.".battery-menu" = {
      source = ../configFiles/battery-menu.sh;
      executable = true;
    };
  };
}
