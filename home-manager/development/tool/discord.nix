
{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.tool.discord.enable = lib.mkEnableOption "Enable GitHub Desktop App";

  config = lib.mkIf config.development.tool.discord.enable {
    home.packages = with pkgs; [
      discord
    ];
  };
}
