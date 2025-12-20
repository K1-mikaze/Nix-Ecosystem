{
  imports = [
    ./profile/battery/set-battery-limit.nix
    ./desktopEnvironment/hyprland/hyprland.nix
    ./desktopEnvironment/gnome/gnomeModule.nix
    ./hardware/hardware-configuration.nix
    ./shell/zsh.nix
  ];
}
