{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./mysql/mysql.nix
    ./sqlite/sqlite.nix
    ./postgresql/postgresql.nix
  ];

  options.database.enableAll = lib.mkEnableOption "Enables PostgreSQL and MySQL services";

  config = lib.mkIf config.database.enableAll {
    database.mysql.enable = true;
    database.postgresql.enable = true;
  };
}
