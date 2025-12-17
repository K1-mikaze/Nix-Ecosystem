{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.language.nix.enable = lib.mkEnableOption "Nix language tooling";

  config = lib.mkIf config.development.language.nix.enable {
    home.packages = with pkgs; [
      nixd
      alejandra
    ];
  };
}
