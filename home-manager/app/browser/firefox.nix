{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.browser.firefox.enable = lib.mkEnableOption "Enable Firefox browser";

  config = lib.mkIf config.app.browser.firefox.enable {
    programs = {
      firefox = {
        enable = true;
      };
    };
  };
}
