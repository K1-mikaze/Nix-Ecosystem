{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.music.gapless.enable = lib.mkEnableOption "Enable Gapless Music Player";

  config = lib.mkIf config.app.music.gapless.enable {
    home.packages = with pkgs; [
      gapless
    ];
  };
}
