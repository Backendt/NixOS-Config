{ config, pkgs, ... }:

{
    imports = [ ./sxhkd.nix ./polybar.nix ];

    xsession = {
        enable = true;
        windowManager.bspwm = {
            enable = true;

            monitors = {
                DP-0 = [ "1" "2" "3" "4" "5" "6" ];
                HDMI-0 = [ "7" "8" "9" "10" ];
            };

            settings = {
                border_width = 2;
                window_gap = 6;
                split_ratio = 0.52;
                borderless_monocle = true;
                gapless_monocle = true;

                focused_border_color = "#5de4c7";
                normal_border_color = "#333333";
            };

            startupPrograms = [
                "sxhkd"
                "wmname LG3D"
                "sh ~/.monitors"
                "sh ~/.fehbg"
                "sh ~/.config/polybar/start.sh"
            ];

        };
    };

    # Make sure the dbus daemon is properly started, then start bspwm
    home.file.".xinitrc".text = ''
    if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
        eval $(dbus-launch --exit-with-session --sh-syntax)
    fi
    systemctl --user import-environment DISPLAY XAUTHORITY

    if command -v dbus-update-activation-environment >/dev/null 2>&1; then
        dbus-update-activation-environment DISPLAY XAUTHORITY
    fi
    exec bspwm
    '';
}
