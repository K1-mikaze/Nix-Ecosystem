{
  pkgs,
  lib,
  config,
  ...
}: {
  options.system.hyprland.lock-screen.enable = lib.mkEnableOption "Enables Calcurse calendar in hyperland";

  config = lib.mkIf config.system.hyprland.lock-screen.enable {
    home.packages = with pkgs; [hyprlock];
  };
}
