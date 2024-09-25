
{ config, pkgs, ... }:

{
    imports = [
        ./keybindings.nix
        ./visual.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        settings = {

            # Allow tearing for steam games
            general.allow_tearing = true;
            windowrulev2 = "immediate, class:^steam_app\d+$";

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

            # TODO Find a clean way to fix hyprpaper service
            exec = ["systemctl --user restart hyprpaper"];
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
