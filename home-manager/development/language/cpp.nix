{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.language.cpp.enable = lib.mkEnableOption "Enables C and C++ Development and its MySQL connector";

  config = lib.mkIf config.development.language.cpp.enable {
    home.packages = with pkgs; [
      clang
      clang-tools
      mariadb-connector-c
      cmake
      gnumake
    ];
  };
}
