{
  imports = [
    ./profile/battery/set-battery-limit.nix
    ./desktop/gnome/gnomeModule.nix
    ./desktop/kdePlasma/kdePlasmaModule.nix
    ./hardware/hardware-configuration.nix
    ./shell/zsh.nix
  ];
}
