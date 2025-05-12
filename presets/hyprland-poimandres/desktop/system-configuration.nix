{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ../../bundles/system/desktop-base.nix
      ../../bundles/system/gaming.nix
      ../../../modules/system/hyprland.nix
    ];

  networking.hostName = "nixos-desktop";

  # Set desktop replay monitor
  programs.gpu-screen-recorder-replay.monitor = "DP-1";

  # Required by easy effects
  programs.dconf.enable = true;
}
