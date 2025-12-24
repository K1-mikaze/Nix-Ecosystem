{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.other.spotify.enable = lib.mkEnableOption "Enable Spotify";

  config = lib.mkIf config.app.other.spotify.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
