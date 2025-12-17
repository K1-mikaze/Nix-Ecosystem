{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.tool.obsidian.enable = lib.mkEnableOption "Enable Obsidian Note Taker";

  config = lib.mkIf config.development.tool.obsidian.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
