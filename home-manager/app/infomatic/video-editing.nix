{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.infomatic.video-editing.enable = lib.mkEnableOption "Enable OBS Studio";

  config = lib.mkIf config.app.infomatic.video-editing.enable {
    home.packages = with pkgs; [
      obs-studio
    ];
  };
}
