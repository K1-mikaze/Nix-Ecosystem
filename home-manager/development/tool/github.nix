{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.tool.github.enable = lib.mkEnableOption "Enable GitHub Desktop App";

  config = lib.mkIf config.development.tool.github.enable {
    home.packages = with pkgs; [
      github-desktop
    ];
  };
}
