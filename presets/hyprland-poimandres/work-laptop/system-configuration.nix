{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ../../bundles/system/work-hardware-configuration.nix
      ../../bundles/system/laptop-base.nix
      ../../bundles/system/work-laptop-thinkpad.nix
      ../../../modules/system/hyprland.nix
    ];

    networking.hostName = "nixos-work";
}
