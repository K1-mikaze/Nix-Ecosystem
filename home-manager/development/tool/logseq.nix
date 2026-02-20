{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.tool.logseq.enable = lib.mkEnableOption "Enable Obsidian Note Taker";

  config = lib.mkIf config.development.tool.logseq.enable {
    home.packages = with pkgs; [
      logseq
    ];
  };
}
