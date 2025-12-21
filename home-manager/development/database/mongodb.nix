{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.database.mongodb.enable = lib.mkEnableOption "Enable MongoDB Client";

  config = lib.mkIf config.development.database.mongodb.enable {
    home.packages = with pkgs; [
      mongodb
    ];
  };
}
