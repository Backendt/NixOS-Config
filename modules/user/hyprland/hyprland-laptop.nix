
{ config, lib, pkgs, ... }:

{
    imports = [
        ./common.nix
    ];

    wayland.windowManager.hyprland.settings = {
        # Disable battery hungry effects
        decoration = {
            drop_shadow = false;
            blur.enabled = lib.mkForce false;
        };
        misc.vfr = true;

        # Invert scrolling direction
        input.natural_scroll = true;
    };

}
