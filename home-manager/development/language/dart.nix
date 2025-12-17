{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.language.dart.enable = lib.mkEnableOption "Enables Flutter Development";

  config = lib.mkIf config.development.language.dart.enable {
    home.packages = with pkgs; [
      flutter
      android-studio
    ];

    home.sessionVariables = {
      # FLUTTER_ROOT = "${pkgs.flutter}";
    };
  };
}
