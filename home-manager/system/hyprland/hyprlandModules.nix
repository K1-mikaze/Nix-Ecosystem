{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./hyprlock/hyprlock.nix
    ./hyprpaper/hyprpaper.nix
    ./hyprshot/hyprshot.nix
    ./waybar/waybar.nix
    ./rofi/rofi.nix
    ./dunst/dunst.nix
    ./calendar/calendar.nix
    ./hypridle/hypridle.nix
    ./touchpad/touchpad.nix
    ./plugins/plugins.nix
  ];

  options.system.hyprland.enable = lib.mkEnableOption "enables configuration for a hyperland system";

  config = lib.mkIf config.system.hyprland.enable {
    home.file.".config/hypr/hyprland.conf".source = ./configFiles/hyprland.conf;
    home.packages = with pkgs; [
      mpv
      nerd-fonts.jetbrains-mono
      candy-icons
      font-awesome
    ];

    ## Hyprland Theme
    dconf.enable = true;
    gtk = {
      enable = true;
      iconTheme = {
        name = "candy-icons";
        package = pkgs.candy-icons;
      };
      font = {
        name = lib.mkForce "JetBrainsMono Nerd Font 11";
        size = 8;
      };
    };
    qt = {
      enable = true;
      platformTheme = {
        name = "adwaita";
      };
      style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
      };
    };

    system.hyprland = {
      plugins.enable = false;
      calendar.enable = true;
      notifications.enable = true;
      lock-screen.enable = true;
      wallpaper.enable = true;
      suspend.enable = true;
      screenshots.enable = true;
      app-launcher.enable = true;
      app-bar.enable = true;
      touchpad.enable = true;
    };
  };
}
