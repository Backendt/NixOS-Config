{ config, pkgs, ... }:

{
    imports = [
        ./base.nix
        ../../../modules/system/pipewire/common.nix
        ../../../modules/system/bluetooth.nix
    ];

    # Enable wifi
    networking = {
        wireless = {
            iwd.enable = true;
        };
        networkmanager.wifi.backend = "iwd";
    };
}
