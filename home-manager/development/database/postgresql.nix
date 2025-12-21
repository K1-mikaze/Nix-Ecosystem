{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.database.postgresql.enable = lib.mkEnableOption "Enable GitHub Desktop App";

  config = lib.mkIf config.development.database.postgresql.enable {
    home.packages = with pkgs; [
      postgresql
    ];
  };
}
