{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.IDE.jetbrains.android-studio.enable = lib.mkEnableOption "Enables Jetbrains Android Studio";

  config = lib.mkIf config.development.IDE.jetbrains.android-studio.enable {
    home.packages = with pkgs; [
      android-studio
      # === Plugins ===
      #"catppuccin-icons"
      #"catppuccin-theme"
      #"ideavim"
      # "flutter"
      #"which-key"
    ];
  };
}
