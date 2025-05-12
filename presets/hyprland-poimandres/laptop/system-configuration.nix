{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ../../bundles/system/laptop-hardware-configuration.nix
      ../../bundles/system/laptop-base.nix
      ../../../modules/system/hyprland.nix
    ];

    networking.hostName = "nixos-laptop";
}
