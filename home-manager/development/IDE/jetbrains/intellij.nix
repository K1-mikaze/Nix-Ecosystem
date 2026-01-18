{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.IDE.jetbrains.intellij.enable = lib.mkEnableOption "Enables Jetbrains Intellij Community Edition";

  config = lib.mkIf config.development.IDE.jetbrains.intellij.enable {
    home.packages = with pkgs.jetbrains; [
      idea
    ];
  };
}
