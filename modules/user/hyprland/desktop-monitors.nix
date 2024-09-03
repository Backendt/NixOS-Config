{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland.settings = {
        monitor = [
            "DP-1, 1920x1080@144, 0x0, 1"
            "HDMI-A-1, 1920x1080, 1920x-400, 1, transform, 1"
            "Unknown-1, disable"
        ];

        # Set primary monitor on XWayland
        exec = "xrandr --output 'DP-1' --primary";
    };

    home.packages = [ pkgs.xorg.xrandr ];
}
