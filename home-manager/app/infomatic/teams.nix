{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.infomatic.teams.enable = lib.mkEnableOption "Enable Photo editor";

  config = lib.mkIf config.app.infomatic.teams.enable {
    home.packages = with pkgs; [teams-for-linux];
  };
}
