{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.database.mysql.enable = lib.mkEnableOption "Enable GitHub Desktop App";

  config = lib.mkIf config.development.database.mysql.enable {
    home.packages = with pkgs; [
      mysql84
    ];
  };
}
