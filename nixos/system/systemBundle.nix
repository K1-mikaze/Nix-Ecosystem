{
  imports = [
    ./profile/battery/set-battery-limit.nix
    ./desktopEnvironment/gnome/gnomeModule.nix
    ./hardware/hardware-configuration.nix
    ./shell/zsh.nix
  ];
}
