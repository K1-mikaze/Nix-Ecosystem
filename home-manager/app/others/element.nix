{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.other.element.enable = lib.mkEnableOption "Enable Element Desktop App a Matrix Client";

  config = lib.mkIf config.app.other.element.enable {
    home.packages = with pkgs; [
      element-desktop
    ];
  };
}
