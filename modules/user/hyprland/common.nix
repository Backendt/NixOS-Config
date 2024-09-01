
{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {

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
        };
    };

    home.packages = with pkgs; [
        slurp
        grim
        wl-clipboard
    ];

    # TODO Move
    programs.wofi.enable = true;

}
