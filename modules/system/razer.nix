{ pkgs, ... }:

{
    # Add openrazer
    hardware.openrazer = {
        enable = true;
        users = [ "mat" ];
        batteryNotifier = {
            percentage = 10; # Notify when below 10% battery
            frequency = 30*60; # Notify every 30 minutes
        };
    };

    # Add razergenie
    environment.systemPackages = [
        pkgs.razergenie
    ];
}
