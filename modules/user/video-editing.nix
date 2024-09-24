{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        yt-dlp
        unstable.kdePackages.kdenlive
        unstable.glaxnimate # Needed for kdenlive
    ];
}
