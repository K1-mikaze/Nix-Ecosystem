{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.other.tangram.enable = lib.mkEnableOption "Enable Ferdium Desktop App to manage Whatsapp, Discord , Teams, Outlook and much more apps available only in the web";

  config = lib.mkIf config.app.other.tangram.enable {
    home.packages = with pkgs; [
      tangram
    ];
  };
}
