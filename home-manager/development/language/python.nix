{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.language.python.enable = lib.mkEnableOption "Enables python development and some libraries";

  config = lib.mkIf config.development.language.python.enable {
    home.packages = with pkgs; [
      pyright
    ];
  };
}
