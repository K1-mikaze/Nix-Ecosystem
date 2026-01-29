{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.desktop.gnome.custom.keymaps.enable = lib.mkEnableOption "Enable Gnome Extensions";

  config = lib.mkIf config.system.desktop.gnome.custom.keymaps.enable {
    dconf = {
      settings = {
        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings = [
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
            "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
          ];
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          name = "Open terminal";
          command = "foot";
          binding = "<Super>c";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
          name = "Open the Web browser";
          command = "brave";
          binding = "<Super>b";
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
          name = "Disable Touchpad";
          command = "gsettings set org.gnome.desktop.peripherals.touchpad send-events disabled";
          binding = "F10";
        };
        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
          name = "Enable Touchpad";
          command = "gsettings set org.gnome.desktop.peripherals.touchpad send-events enabled";
          binding = "F11";
        };

        "org/gnome/desktop/input-sources" = {
          xkb-options = ["caps:escape"];
          sources = [(pkgs.lib.gvariant.mkTuple ["xkb" "latam"])];
        };

        "org/gnome/desktop/wm/keybindings" = {
          move-to-workspace-1 = ["<Super><Shift>1"];
          move-to-workspace-2 = ["<Super><Shift>2"];
          move-to-workspace-3 = ["<Super><Shift>3"];
          move-to-workspace-4 = ["<Super><Shift>4"];
          switch-to-workspace-1 = ["<Super>1"];
          switch-to-workspace-2 = ["<Super>2"];
          switch-to-workspace-3 = ["<Super>3"];
          switch-to-workspace-4 = ["<Super>4"];
        };

        "org/gnome/mutter" = {
          dynamic-workspaces = false;
        };

        "org/gnome/desktop/wm/preferences".num-workspaces = lib.gvariant.mkUint32 4;
      };
    };
  };
}
