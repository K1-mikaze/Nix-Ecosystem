{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.browser.brave.enable = lib.mkEnableOption "Enable Brave browser";

  config = lib.mkIf config.app.browser.brave.enable {
    home.packages = with pkgs; [brave];
  };
}
