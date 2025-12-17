{
  pkgs,
  lib,
  config,
  ...
}: {
  options.system.hyprland.notifications.enable = lib.mkEnableOption "Enables Calcurse calendar in hyperland";

  config = lib.mkIf config.system.hyprland.notifications.enable {
    home.packages = with pkgs; [
      dunst
      libnotify
    ];

    home.file.".config/dunst/dunstrc".source = ../configFiles/dunstrc;
  };
}
