{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ../../bundles/system/laptop-base.nix
      ../../../modules/system/hyprland.nix
    ];
}
