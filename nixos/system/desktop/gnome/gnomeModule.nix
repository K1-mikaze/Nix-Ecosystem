{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./services/exclude.nix
    ./services/configuration.nix
  ];
  options.system.desktop.gnome.enable = lib.mkEnableOption "Enable Gnome Desktop Environment";

  config = lib.mkIf config.system.desktop.gnome.enable {
    environment.systemPackages = with pkgs; [
      foot
    ];

    system.desktop.gnome = {
      services = {
        configuration.enable = true;
        exclude.enable = true;
      };
    };
  };
}
