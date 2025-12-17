{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.tool.notion.enable = lib.mkEnableOption "Enable GitHub Desktop App";

  config = lib.mkIf config.development.tool.notion.enable {
    home.packages = with pkgs; [
      notion-app
    ];
  };
}
