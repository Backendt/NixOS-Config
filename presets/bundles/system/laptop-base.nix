{ config, pkgs, ... }:

{
    imports = [
        ./laptop-hardware-configuration.nix
        ./base.nix
        ../../../modules/system/pipewire/common.nix
        ../../../modules/system/bluetooth.nix
    ];

    # Hostname (used in flake.nix !)
    networking.hostName = "nixos-laptop";

    # Enable wifi
    networking = {
        wireless = {
            iwd.enable = true;
        };
        networkmanager.wifi.backend = "iwd";
    };
}
