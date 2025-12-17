{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.language.java.enable = lib.mkEnableOption "Enables Java Jdt Java Development ";

  config = lib.mkIf config.development.language.java.enable {
    home.packages = with pkgs; [
      jdt-language-server
    ];
  };
}
