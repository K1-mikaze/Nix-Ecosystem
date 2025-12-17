{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.IDE.vscode.enable = lib.mkEnableOption "Enables Visual Studio Code";

  config = lib.mkIf config.development.IDE.vscode.enable {
    home.packages = with pkgs; [
      vscode-fhs
    ];
  };
}
