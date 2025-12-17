{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.infomatic.mendeley.enable = lib.mkEnableOption "Enable Mendeley";

  config = lib.mkIf config.app.infomatic.mendeley.enable {
    home.packages = with pkgs; [mendeley];
  };
}
