{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.app.infomatic.libreoffice.enable = lib.mkEnableOption "Enable Only-office";

  config = lib.mkIf config.app.infomatic.libreoffice.enable {
    home.packages = with pkgs; [
      libreoffice
    ];
  };
}
