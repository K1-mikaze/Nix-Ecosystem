{
  pkgs,
  lib,
  config,
  ...
}: {
  options.system.hyprland.suspend.enable = lib.mkEnableOption "Enables Hibernate in Hyprland";

  config = lib.mkIf config.system.hyprland.suspend.enable {
    home.packages = with pkgs; [hypridle];

    home.file.".config/hypr/hypridle.conf".source = ../configFiles/hypridle.conf;
  };
}
