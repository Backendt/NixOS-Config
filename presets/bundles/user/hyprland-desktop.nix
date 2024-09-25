{ config, pkgs, ... }:

{
    imports = let
        modules = ../../../modules/user;
    in [
        (modules + "/hyprland/hyprland-desktop.nix")
        (modules + "/waybar/desktop-hyprland.nix")
        (modules + "/mako.nix")
    ];
}
