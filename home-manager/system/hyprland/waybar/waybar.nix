{
  pkgs,
  lib,
  config,
  ...
}: {
  options.system.hyprland.app-bar.enable = lib.mkEnableOption "Enables Waybar in hyprland";

  config = lib.mkIf config.system.hyprland.app-bar.enable {
    home.packages = with pkgs; [
      pavucontrol
      blueman
    ];

    programs.waybar = {
      enable = true;
      systemd.enable = true;
      settings = {
        mainBar = {
          position = "bottom";
          output = "eDP-1";
          fixed-center = true;
          margin = "1 1 1 1";

          height = 40;
          spacing = 4;

          modules-left = [
            "hyprland/workspaces"
            "clock"
            "pulseaudio"
          ];

          modules-center = [
            #"hyprland/workspaces"
          ];

          "hyprland/workspaces" = {
            "format" = "{name}";
            "on-click" = "activate";
          };

          "clock" = {
            format = " {:%H:%M}  ";
            tooltip-format = "<big>{:%A, %d %B %Y} </big>"; # Hover tooltip
            on-click = "foot -e calcurse";
          };

          modules-right = [
            "network"
            "bluetooth"
            "power-profiles-daemon"
            "battery"
          ];

          "bluetooth" = {
            "format" = "  "; # Font Awesome Bluetooth icon
            "format-disabled" = "  ";
            "format-connected" = "  {device_alias}";
            "tooltip-format" = "Bluetooth\n{device_enumerate}";
            "tooltip-format-enumerate-connected" = "{device_alias} ({device_address})";
            "on-click" = "blueman-manager"; # Open Bluetooth manager (requires `blueman`)
          };

          pulseaudio = {
            format = "{volume}% {icon}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source-muted = " ";
            format-icons = {
              headphone = " ";
              hands-free = "󰥰 ";
              headset = "󰋍 ";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };
            on-click = "pavucontrol";
          };
          network = {
            format-wifi = "  ";
            format-ethernet = "{essid}/{cidr} 󰈁";
            tooltip-format = "{essid}  ";
            format-linked = "{ifname} (No IP)  ";
            format-disconnected = "󰖪 not connection";
            on-click = "~/.rofi-wifi-menu";
          };

          battery = {
            states = {
              warning = 40;
              critical = 20;
            };
            format = "{capacity}% {icon}";
            format-full = "{capacity}% {icon}";
            format-charging = "{capacity}%  ";
            format-plugged = "{capacity}% ";
            format-alt = "{capacity}% {icon}";
            format-icons = ["" "" "" "" ""];
            on-click = "~/.battery-menu";

            interval = 5; # Update interval in seconds
            max-capacity = 100; # Maximum capacity value
          };

          power-profiles-daemon = {
            format = "{icon}";
            tooltip-format = "Power profile: {profile}nDriver: {driver}";
            tooltip = true;
            format-icons = {
              default = "";
              performance = "";
              balanced = "";
              "power-saver" = "";
            };
          };
        };
      };

      style = builtins.readFile ./style.css;
    };
  };
}
