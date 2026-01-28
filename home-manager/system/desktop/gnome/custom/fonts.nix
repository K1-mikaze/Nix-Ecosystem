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
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        font-name = "Jetbrains Mono Nerd Font";
        monospace-font-name = "Jetbrains Mono Nerd Font";
        document-font-name = "Jetbrains Mono Nerd Font";
      };
      "org/gnome/desktop/wm/preferences" = {
        titlebar-font = "Jetbrains Mono Nerd Font";
      };
    };
  };
}
