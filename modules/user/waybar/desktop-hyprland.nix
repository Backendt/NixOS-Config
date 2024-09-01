{ config, pkgs, ... }:

{
    imports = [ ./common-hyprland.nix ];

    programs.waybar.settings.main.output = "DP-1";
}
