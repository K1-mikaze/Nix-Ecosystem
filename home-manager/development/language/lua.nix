{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.language.lua.enable = lib.mkEnableOption "Enables Lua Language Server";

  config = lib.mkIf config.development.language.lua.enable {
    home.packages = with pkgs; [
      lua-language-server
    ];
  };
}
