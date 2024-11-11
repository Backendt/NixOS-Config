{ pkgs, ... }:

{
    # Add openrazer
    hardware.openrazer = {
        enable = true;
        users = [ "mat" ];
    };

    # Add razergenie
    environment.systemPackages = [
        pkgs.razergenie
    ];
}
