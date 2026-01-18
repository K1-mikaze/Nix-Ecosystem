{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./services/exclude.nix
    ./services/configuration.nix
    ./custom/extensions.nix
    ./custom/fonts.nix
    ./custom/theme.nix
    ./custom/keymaps.nix
  ];
  options.system.desktop_environment.gnome.enable = lib.mkEnableOption "Enable Gnome Desktop Environment";

  config = lib.mkIf config.system.desktop_environment.gnome.enable {
    environment.systemPackages = with pkgs; [
      foot
      brave
      dracula-theme
    ];

    system.desktop_environment.gnome = {
      services = {
        configuration.enable = true;
        exclude.enable = true;
      };
      custom = {
        extensions.enable = true;
        keymaps.enable = true;
        theme.enable = true;
        fonts.enable = true;
      };
    };
  };
}
