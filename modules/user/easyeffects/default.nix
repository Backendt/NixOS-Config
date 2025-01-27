{ ... }:

let
    presetFilename = "microphone";
in {

    xdg.configFile."easyeffects/input/${presetFilename}.json".source = ./mic-preset.json;

    services.easyeffects = {
        enable = true;
        preset = presetFilename;
    };
}
