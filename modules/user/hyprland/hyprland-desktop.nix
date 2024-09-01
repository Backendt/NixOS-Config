
{ config, lib, pkgs, ... }:

{
    imports = [
        ./common.nix
        ./keybindings.nix
        ./desktop-monitors.nix
        ./desktop-workspaces.nix
        ./visual.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        settings = {

            env = [
                "LIBVA_DRIVER_NAME,nvidia"
                "XDG_SESSION_TYPE,wayland"
                "GDM_BACKEND,nvidia-drm"
                "__GLX_VENDOR_LIBRARY_NAME,nvidia"
                "NIXOS_OZONE_WL,1"
            ];

            dwindle = {
                pseudotile = true;
                preserve_split = true;
            };

            master.new_status = "master";

            input = {
                kb_layout = "fr";
                numlock_by_default = true;

                follow_mouse = 2;
                sensitivity = 0;
                accel_profile = "flat";
            };

            cursor = {
                default_monitor = "DP-1";
                #no_hardware_cursors = true;
            };
        };
    };
}
