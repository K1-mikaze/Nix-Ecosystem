{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.database.redis.enable = lib.mkEnableOption "Enable Redis Database Client";

  config = lib.mkIf config.development.database.redis.enable {
    home.packages = with pkgs; [
      redis
    ];
  };
}
