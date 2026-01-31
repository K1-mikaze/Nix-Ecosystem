{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop.gnome.custom.fonts.enable = lib.mkEnableOption "Enable Gnome Fonts";

  config = lib.mkIf config.system.desktop.gnome.custom.fonts.enable {
    home.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
