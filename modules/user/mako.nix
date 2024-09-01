{ config, pkgs, ... }:
# TODO Remove comments
{
    services.mako = {
        enable = true;
        #font = "JetBrains Mono";
        layer = "overlay";

        #borderColor = "#5DE4C7";
        #backgroundColor = "#101318";
        borderRadius = 5;
        defaultTimeout = 3500; # In milliseconds

        #extraConfig = ''
        #    [urgency=critical]
        #    border-color=#D0679D
        #'';
    };
}
