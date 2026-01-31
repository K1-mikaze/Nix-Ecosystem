{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.infomatic.gradia.enable = lib.mkEnableOption "Enable Photo editor";

  config = lib.mkIf config.app.infomatic.gradia.enable {
    home.packages = with pkgs; [gradia];
  };
}
