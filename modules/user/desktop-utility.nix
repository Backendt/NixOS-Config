{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        gimp
        onlyoffice-bin
        vlc
        feh
        vesktop
        spotify
        playerctl
    ];
}