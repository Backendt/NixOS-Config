{ config, pkgs, ... }:

{
    imports = [
        ./laptop-hardware-configuration.nix
        ./base.nix
        ../../../modules/system/pipewire/common.nix
    ];

    # Hostname (used in flake.nix !)
    networking.hostName = "nixos-laptop";

    # Enable wifi
    networking.wireless.enable = true;
}
