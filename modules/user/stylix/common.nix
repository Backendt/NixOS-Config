{ config, pkgs, ... }:

{
    stylix = {
        enable = true;
        autoEnable = true;
        polarity = "dark";

        fonts = {
            monospace = {
                package = pkgs.jetbrains-mono;
                name = "JetBrains Mono";
            };
        };
    };
}
