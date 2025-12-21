{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.database.sqlite.enable = lib.mkEnableOption "Enable SQLite Client";

  config = lib.mkIf config.development.database.sqlite.enable {
    home.packages = with pkgs; [
      sqlite
    ];
  };
}
