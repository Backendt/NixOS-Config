{ config, pkgs, ...}:

{
    imports = [
        ../../bundles/user/base.nix
        ../../bundles/user/hyprland-work.nix
        ../../../modules/user/stylix/poimandres.nix
    ];
}
