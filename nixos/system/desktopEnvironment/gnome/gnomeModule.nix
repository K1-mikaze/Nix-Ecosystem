{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./services/exclude.nix
    ./services/configuration.nix
    ./extensions.nix
    ./fonts.nix
  ];
  options.system.desktop_environment.gnome.enable = lib.mkEnableOption "Enable Gnome Desktop Environment";

  config = lib.mkIf config.system.desktop_environment.gnome.enable {
    environment.systemPackages = with pkgs; [
      # kitty
      foot
    ];

    system.desktop_environment.gnome = {
      services = {
        configuration.enable = true;
        exclude.enable = true;
      };
      extensions.enable = true;
      fonts.enable = true;
    };
  };
}
