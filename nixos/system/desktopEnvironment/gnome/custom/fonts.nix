{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop_environment.gnome.custom.fonts.enable = lib.mkEnableOption "Enable Gnome Fonts";

  config = lib.mkIf config.system.desktop_environment.gnome.custom.fonts.enable {
    fonts = {
      packages = with pkgs; [
        nerd-fonts.jetbrains-mono
      ];

      fontconfig = {
        defaultFonts = {
          sansSerif = ["JetBrains Mono Nerd Font"];
          monospace = ["JetBrains Mono Nerd Font"];
          serif = ["JetBrains Mono Nerd Font"];
        };
      };
    };
  };
}
