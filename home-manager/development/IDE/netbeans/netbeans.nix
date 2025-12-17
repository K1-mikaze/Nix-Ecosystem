{
  pkgs,
  lib,
  config,
  ...
}: {
  options.development.IDE.netbeans.enable = lib.mkEnableOption "Enables Apache Netbeans IDE";

  config = lib.mkIf config.development.IDE.netbeans.enable {
    home.packages = with pkgs; [
      netbeans
    ];
  };
}
