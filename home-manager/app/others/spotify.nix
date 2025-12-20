{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.infomatic.spotify.enable = lib.mkEnableOption "Enable Spotify";

  config = lib.mkIf config.app.infomatic.spotify.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
