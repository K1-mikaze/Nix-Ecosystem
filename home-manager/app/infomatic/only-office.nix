{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.infomatic.only-office.enable = lib.mkEnableOption "Enable Only-office";

  config = lib.mkIf config.app.infomatic.only-office.enable {
    home.packages = with pkgs; [
      onlyoffice-desktopeditors
    ];
  };
}
