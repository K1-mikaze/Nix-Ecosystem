{
  imports = [
    ./profile/battery/set60.nix
    ./profile/battery/set90.nix
    ./desktopEnvironment/hyprland/hyprland.nix
    ./desktopEnvironment/gnome/gnomeModule.nix
    ./hardware/hardware-configuration.nix
    ./shell/zsh.nix
  ];
}
