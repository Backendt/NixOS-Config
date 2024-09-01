{ config, pkgs, ... }:

{
    services.xserver = {
        enable = true;
        displayManager.startx.enable = true;
    };

    environment.systemPackages = with pkgs; [
        maim
        xclip
        wmname
        rofi
        dunst
        numlockx
    ];

}
