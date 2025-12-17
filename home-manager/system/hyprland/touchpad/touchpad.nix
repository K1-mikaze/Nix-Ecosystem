{
  pkgs,
  lib,
  config,
  ...
}: {
  options.system.hyprland.touchpad.enable = lib.mkEnableOption "Enables Calcurse calendar in hyperland";

  config = lib.mkIf config.system.hyprland.touchpad.enable {
    home.file.".touchpad-status" = {
      source = ../configFiles/touchpach-status.sh;
      executable = true;
    };
  };
}
