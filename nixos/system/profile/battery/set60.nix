{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.profile.battery.set60.enable = lib.mkEnableOption "Enable battery charge limit to 60% in the system";

  config = lib.mkIf config.system.profile.battery.set60.enable {
    environment.systemPackages = with pkgs; [
      (writeShellScriptBin "save-bat" ''
        cd /sys/class/power_supply/BAT0/
        sudo sh -c "echo 60 > charge_control_end_threshold"
        cd ~
      '')
    ];
  };
}
