{
  pkgs,
  lib,
  config,
  ...
}: {
  options.app.other.discord.enable = lib.mkEnableOption "Enable Discord Desktop App";

  config = lib.mkIf config.app.other.discord.enable {
    home.packages = with pkgs; [
      discord
    ];
  };
}
