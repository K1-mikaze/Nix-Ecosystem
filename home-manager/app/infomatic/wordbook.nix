{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.app.infomatic.wordbook.enable =
    lib.mkEnableOption "Enable WordBook an offline English dictionary";

  config = lib.mkIf config.app.infomatic.wordbook.enable {
    home.packages = with pkgs; [ wordbook ];
  };
}
