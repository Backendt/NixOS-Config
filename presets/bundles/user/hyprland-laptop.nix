{ config, pkgs, ... }:

{
    imports = let
        modules = ../../../modules/user;
    in [
        (modules + "/hyprland/common.nix")
        (modules + "/waybar/common-hyprland.nix")
        (modules + "/mako.nix")
    ];
}
