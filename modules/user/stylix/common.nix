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

            sansSerif = {
                package = pkgs.jetbrains-mono;
                name = "TeX Gyre Heros";
            };
        };
    };
}
