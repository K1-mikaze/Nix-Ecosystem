{
  config,
  lib,
  ...
}: {
  options.system.desktop.gnome.custom.autostart.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop.gnome.custom.autostart.enable {
    home.file = lib.mkMerge [
      (lib.mkIf config.app.infomatic.planify.enable {
        ".config/autostart/planify.desktop".text = ''
          [Desktop Entry]
          Version=1.0
          Terminal=false
          Type=Application
          Name=Planify
          Exec=io.github.alainm23.planify
        '';
      })
      (lib.mkIf config.app.other.tangram.enable {
        ".config/autostart/tangram.desktop".text = ''
          [Desktop Entry]
          Version=1.0
          Terminal=false
          Type=Application
          Name=Tangram
          Exec=re.sonny.Tangram
        '';
      })
    ];

    dconf = lib.mkIf (config.app.other.tangram.enable || config.app.infomatic.planify.enable) {
      settings = {
        "org/gnome/shell/extensions/auto-move-windows" = {
          application-list = [
            "re.sonny.Tangram.desktop:1"
            "io.github.alainm23.planify.desktop:1"
          ];
        };
      };
    };
  };
}
