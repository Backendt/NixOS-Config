{ config, pkgs, ... }:

{
    imports = [ ./common.nix ];

    # Set microphone as mono input
    services.pipewire.wireplumber.configPackages = [
        (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/51-mono-microphone.conf" ''
            monitor.alsa.rules = [
                {
                    matches = [
                        {
                            node.name = "alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo-input"
                        }
                    ]
                    actions = {
                        update-props = {
                            audio.position = "MONO"
                        }
                    }
                }
            ]
          '')
    ];
}
