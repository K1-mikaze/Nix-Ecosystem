{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.music.spotube.enable = lib.mkEnableOption "Enable Spotube Music Player";

  config = lib.mkIf config.app.music.spotube.enable {
    home.packages = with pkgs; [
      spotube
    ];
  };
}
