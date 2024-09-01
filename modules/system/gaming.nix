{ config, pkgs, ... }:

{
    programs.steam = {
        enable = true;
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server

        #remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        #localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };

    programs.gamemode.enable = true;
}
