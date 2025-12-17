{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.tool.penpot.enable = lib.mkEnableOption "Enable Figma Designer";

  config = lib.mkIf config.development.tool.penpot.enable {
    home.packages = with pkgs; [
      penpot-desktop
    ];
  };
}
