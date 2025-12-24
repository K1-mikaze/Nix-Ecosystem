{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.other.spotube.enable = lib.mkEnableOption "Enable Spotube Music Player";

  config = lib.mkIf config.app.other.spotube.enable {
    home.packages = with pkgs; [
      spotube
    ];
  };
}
