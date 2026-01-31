{
  config,
  lib,
  ...
}: {
  imports = [
    ./custom/extensions.nix
    ./custom/fonts.nix
    ./custom/theme.nix
    ./custom/keymaps.nix
    ./custom/autostart.nix
  ];
  options.system.desktop.gnome.enable = lib.mkEnableOption "Enable Gnome Desktop Environment";

  config = lib.mkIf config.system.desktop.gnome.enable {
    system.desktop.gnome.custom = {
      autostart.enable = true;
      extensions.enable = true;
      keymaps.enable = true;
      theme.enable = true;
      fonts.enable = true;
    };
  };
}
