
{ config, lib, pkgs, ... }:

{
    imports = [
        ./common.nix
    ];

    # Disable battery hungry effects
    wayland.windowManager.hyprland.settings = {
        decoration = {
            drop_shadow = false;
            blur.enabled = lib.mkForce false;
        };
        misc.vfr = true;
    };

}
