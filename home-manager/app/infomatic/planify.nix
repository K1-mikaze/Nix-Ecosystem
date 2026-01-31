{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.infomatic.planify.enable = lib.mkEnableOption "Enable Photo editor";

  config = lib.mkIf config.app.infomatic.planify.enable {
    home.packages = with pkgs; [planify];
  };
}
