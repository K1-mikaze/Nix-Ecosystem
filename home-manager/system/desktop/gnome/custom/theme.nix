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
          accent-color = "blue";
          color-scheme = "prefer-dark";
          show-battery-percentage = true;
          cursor-theme = "Adwaita";
          enable-hot-corners = false;
        };

        "org/gnome/desktop/a11y/interface" = {
          high-contrast = false;
        };

        "org/gnome/desktop/background" = {
          picture-uri-dark = "file://${../../../../../assets/nix-dark.jpg}";
          picture-uri = "file://${../../../../../assets/nix-light.jpg}";
          picture-options = "center";
          color-shading-type = "solid";
        };

        # Transparent top bar
        "com/ftpix/transparentbar" = {
          dark-full-screen = true;
          transparency = 0;
        };

        "org/gnome/shell/extensions/top-panel-logo" = {
          icon-path = "${../../../../../assets/NixLogo.png}";
          icon-size = 25;
          horizontal-padding = 0;
        };

        "org/gnome/shell/extensions/quick-settings-audio-panel" = {
          panel-type = "merged-panel";
          remove-output-volume-slider = true;
          merged-panel-position = "top";
          master-volume-sliders-show-current-device = true;
        };

        "org/gnome/shell/extensions/just-perfection" = {
          accessibility-menu = false;
          quick-settings-night-light = false;
          quick-settings-airplane-mode = false;
        };

        "org/gnome/shell/extensions/Battery-Health-Charging" = {
          indicator-position = 5;
        };

        "org.gnome.Console" = {
          audible-bell = false;
          theme = "auto";
          use-system-font = true;
          font-scale = 1.3;
        };
      };
    };
  };
}
