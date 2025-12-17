{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.language.rust.enable = lib.mkEnableOption "Rust language and tooling";

  config = lib.mkIf config.development.language.rust.enable {
    home.packages = with pkgs; [
      rust-analyzer
      rustc
      cargo
    ];
  };
}
