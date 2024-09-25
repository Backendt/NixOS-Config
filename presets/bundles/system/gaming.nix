{ config, pkgs, ... }:

{
    imports = [
        ../../../modules/system/gaming.nix
        ../../../modules/system/replay.nix
    ];

    # Enable replay
    programs.gpu-screen-recorder-replay = {
        enable = true;
        videoPath = "~/Videos/Replays";
        autostart = true;
    };
}
