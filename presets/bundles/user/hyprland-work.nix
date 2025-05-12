{ config, pkgs, ... }:

{
    imports = let
        modules = ../../../modules/user;
    in [
        (modules + "/hyprland/hyprland-laptop.nix")
        (modules + "/hyprland/work-monitors.nix")
        (modules + "/waybar/common-hyprland.nix")
        (modules + "/mako.nix")
    ];
}
