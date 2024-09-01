{ config, pkgs, ... }:

{
    services.sxhkd = {
        enable = true;
        keybindings = {
            # Apps

            "super + Return" = "kitty"; # Terminal # TODO Find a way to get the default terminal
            "super + @space" = "rofi -show-icons -show drun";
            "super + Escape" = "pkill -USR1 -x sxhkd"; # Reload keybinds
            "super + {_,shift + } b" = "firefox {--private-window, }"; # Browser
            "super + shift + s" = "maim -s | xclip -selection clipboard -t image/png"; # Selection screenshot
            "Print" = "maim -u | xclip -selection clipboard -t image/png"; # Full screenshot

            # Audio

            "XF86AudioRaiseVolume" = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
            "XF86AudioLowerVolume" = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
            "XF86AudioMute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            "ctrl + XF86AudioMute" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle; notify-send -a 'Microphone' 'The microphone mute has been toggled'";
            "XF86AudioPlay" = "playerctl play-pause";
            "XF86AudioPrev" = "playerctl previous";
            "XF86AudioNext" = "playerctl next";

            # BSPWM

            "super + shift + Escape" = "bspc wm -r"; # Restart BSPWM
            "super + shift + q" = "bspc node -c"; # Kill selected window TODO Works with super + shift + a ? Is it using a different keyboard layout ?
            "super + f" = "bspc node -t ~fullscreen"; # Toggle fullscreen
            # Move the window in the given direction
            "super + {_,shift + }{Left,Down,Up,Right}" = "bspc node -{f,s} {west,south,north,east}";
            # Send window to desktop
            "super + shift + {1-9,0}" = "bspc node -d '^{1-9,10}' --follow";
            # Switch desktop
            "super + {1-9,0}" = "bspc desktop -f '^{1-9,10}'";
            # Send window to desktop (Numpad)
            "super + shift + {KP_End,KP_Down,KP_Next,KP_Left,KP_Begin,KP_Right,KP_Home,KP_Up,KP_Prior,KP_Insert}" = "bspc node -d '^{1-9,10}' --follow";
            # Switch desktop (Numpad)
            "super + {KP_End,KP_Down,KP_Next,KP_Left,KP_Begin,KP_Right,KP_Home,KP_Up,KP_Prior,KP_Insert}" = "bspc desktop -f '^{1-9,10}'";
            # Alt+Tab and Super+Tab
            "{super, alt} + {_,shift + } Tab" = "bspc {desktop,node} -f {next,previous}";
            # Expend window
            "super + alt + {Left,Down,Up,Right}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
            # Shrink window
            "super + alt + shift + {Left,Down,Up,Right}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";

            # Replay (gpu-screen-recorder)

            # Save replay
            "alt + twosuperior" = "sh ~/.config/gpu-screen-recorder/saveReplay.sh";
            # Toggle replay
            "alt + shift + twosuperior" = "sh ~/.config/gpu-screen-recorder/toggle.sh";
        };
    };
}
