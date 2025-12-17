{
  config,
  pkgs,
  lib,
  ...
}: {
  options.system.profile.battery.set90.enable = lib.mkEnableOption "Enable battery charge limit to 90% profile in the system";

  config = lib.mkIf config.system.profile.battery.set90.enable {
    environment.systemPackages = with pkgs; [
      (writeShellScriptBin "full-bat" ''
        cd /sys/class/power_supply/BAT0/
        sudo sh -c "echo 100 > charge_control_end_threshold"
        cd ~
      '')
    ];
  };
}
