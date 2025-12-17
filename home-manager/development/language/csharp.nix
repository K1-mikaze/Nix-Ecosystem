{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.language.csharp.enable = lib.mkEnableOption "Enables C# Development";

  config = lib.mkIf config.development.language.csharp.enable {
    home.packages = with pkgs; [
      dotnet-sdk_9
      clang
    ];
  };
}
