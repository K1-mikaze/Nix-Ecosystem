{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.language.typescript.enable = lib.mkEnableOption "Enables TypeScript Language and Tooling";

  config = lib.mkIf config.development.language.typescript.enable {
    home.packages = with pkgs; [
      nodejs
      nodePackages.typescript
      nodePackages.firebase-tools
    ];

    home.sessionPath = [
      "$HOME/.pub-cache/bin"
    ];

    home.sessionVariables = {
      FLUTTERFIRE_CLI = "true";
    };
  };
}
