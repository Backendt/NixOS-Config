{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        yt-dlp
        kdePackages.kdenlive
        glaxnimate # Needed for kdenlive
    ];
}
