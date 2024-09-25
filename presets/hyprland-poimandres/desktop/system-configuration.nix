{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ../../bundles/system/desktop-base.nix
      ../../bundles/system/gaming.nix
      ../../../modules/system/hyprland.nix
    ];

  # Set desktop replay monitor
  programs.gpu-screen-recorder-replay.monitor = "DP-1";
}
