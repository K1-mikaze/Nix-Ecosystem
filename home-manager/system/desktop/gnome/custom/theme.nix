{
  config,
  lib,
  ...
}: {
  options.system.desktop.gnome.custom.theme.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop.gnome.custom.theme.enable {
    dconf = {
      settings = {
        "org/gnome/desktop/interface" = {
          accent-color = "purple";
          color-scheme = "prefer-dark";
          show-battery-percentage = true;
          cursor-theme = "Adwaita";
        };

        "org/gnome/desktop/a11y/interface" = {
          high-contrast = true;
        };

        "org/gnome/desktop/background" = {
          picture-uri-dark = "file://${../../../../../assets/rose-pine-nix.webp}";
          picture-uri = "file://${../../../../../assets/nix-catppuccin-latte.png}";
          picture-options = "center";
          color-shading-type = "solid";
        };

        "org/gnome/shell/extensions/dynamic-panel" = {
          top-margin = 0;
          transparent = 0;
          float-width = 100;
          colors-use-in-static = true;
          dark-bg-color = "rgb(24,24,24)";
          light-bg-color = "rgb(249,249,249)";
        };
      };
    };
  };
}
