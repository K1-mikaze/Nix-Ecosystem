{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.IDE.jetbrains.intellij.enable = lib.mkEnableOption "Enables Jetbrains Intellij Community Edition";

  config = lib.mkIf config.development.IDE.jetbrains.intellij.enable {
    home.packages = with pkgs.jetbrains; [
      idea-community
      #(pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.idea-community [
      #"catppuccin-icons"
      #"catppuccin-theme"
      #"ideavim"
      # "smart-tomcat"
      #"spring-boot-assistant"
      #"which-key"])
    ];
  };
}
