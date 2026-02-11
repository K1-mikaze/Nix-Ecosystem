{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.music.spotify.enable = lib.mkEnableOption "Enable Spotify";

  config = lib.mkIf config.app.music.spotify.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
