{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        gimp
        onlyoffice-bin
        vlc
        feh
        unstable.vesktop
        spotify
        chromium
        playerctl
        brightnessctl
    ];
}
