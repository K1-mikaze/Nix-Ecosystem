{
  pkgs,
  config,
  lib,
  ...
}: let
  pluginPkgs = with pkgs; [
    hyprlandPlugins.hyprexpo
  ];
  hyprPluginDir = pkgs.symlinkJoin {
    name = "hyprland-plugins";
    paths = pluginPkgs;
  };
in {
  options.system.hyprland.plugins.enable = lib.mkEnableOption "Enables Hyprland Plugins";

  config = lib.mkIf config.system.hyprland.plugins.enable {
    home.sessionVariables = {
      HYPR_PLUGIN_DIR = hyprPluginDir;
    };
  };
}
