{ config, lib, pkgs, ... }:

let
    cfg = config.programs.gpu-screen-recorder-replay;
    audioParams = ''-a "$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep node.name | awk '{print $4}' | tr -d '"').monitor" -a "$(wpctl inspect @DEFAULT_AUDIO_SOURCE@ | grep node.name | awk '{print $4}' | tr -d '"')"'';
    startReplayCommand = "gpu-screen-recorder -w ${cfg.monitor} -o ${cfg.videoPath} -f ${toString cfg.framerate} -r ${toString cfg.length} -c mp4 ${audioParams} > /dev/null";
    replayStartBinName = "replay-start";
    replayStartPkg = (pkgs.writeShellScriptBin replayStartBinName startReplayCommand);
    replayStartBin = "${replayStartPkg}/bin/${replayStartBinName}";
in {
    options = {
        programs.gpu-screen-recorder-replay = {
            enable = lib.mkEnableOption "gpu-screen-recorder replay";
            package = lib.mkPackageOption pkgs.unstable "gpu-screen-recorder" {};
            length = lib.mkOption {
                type = lib.types.ints.positive;
                default = 20;
                example = 30;
                description = "The replay length in seconds. ('30' will record the past 30 sec)";
            };
            monitor = lib.mkOption {
                type = lib.types.nonEmptyStr;
                default = "screen";
                example = "DP-0";
                description = "The monitor name that should be recorded. 'screen' will record all monitors";
            };
            videoPath = lib.mkOption {
                type = lib.types.str;
                default = "~/Videos";
                example = "/tmp";
                description = "The replay output directory path";
            };
            framerate = lib.mkOption {
                type = lib.types.ints.positive;
                default = 60;
                example = 30;
                description = "The amount of frames per second recorded";
            };
            logFile = lib.mkOption {
                type = lib.types.nonEmptyStr;
                default = "/tmp/gpu-screen-recorder.log";
                example = "~/.local/cache/gpu-screen-recorder.log";
                description = "The log file";
            };
            autostart = lib.mkOption {
                type = lib.types.bool;
                default = false;
                example = true;
                description = "Start the replay automatically with a systemd service";
            };
        };
    };

    config = lib.mkIf cfg.enable {
        environment.systemPackages = [
            # Install gpu-screen-recorder
            cfg.package
            # Add the "replay-start" command
            replayStartPkg
            # Add the "replay-save" command
            (pkgs.writeShellScriptBin "replay-save" ''
                sendNotification() {
                    notify-send -a "GPU Screen Recorder" "$1" "$2"
                    writeToLogs "[INFO] $2"
                }

                sendError() {
                    notify-send -u "critical" -t 7000 -a "GPU Screen Recorder" "$1" "$2"
                    writeToLogs "[ERROR] $2"
                }

                writeToLogs() {
                    log_path='${cfg.logFile}'
                    now=$(date +'%d/%m/%Y %H:%M:%S')
                    echo "$now - $1" >> $log_path
                }   

                if (killall -q -SIGUSR1 gpu-screen-recorder) ; then
                    sendNotification "Replay saved" "The replay has been saved"
                else
                    sendError "Could not save replay" "Replay is not started"
                fi
            '')
        ];

        # Autostart with systemd service
        systemd.user.services.replay = {
            enable = cfg.autostart;
            wants = ["wireplumber.service" "pipewire.socket" "graphical-session.target"];
            after = ["wireplumber.service" "pipewire.socket" "graphical-session.target"];
            wantedBy = ["default.target"];
            description = "Screen recorder used for video replay";
            path = ["/run/current-system/sw"];

            serviceConfig = {
                Type = "simple";
                ExecStart = replayStartBin;

                # Even if started after wipreplumber.service, "wpctl" still fails.
                # I am now choosing the monkey way
                Restart = "on-failure";
                RestartSec = "3s";
            };
        };

        # Add required capabilities to use it without root permissions
        security.wrappers = {
            gsr-kms-server = {
                owner = "root";
                group = "root";
                capabilities = "cap_sys_admin+ep";
                source = "${cfg.package}/bin/gsr-kms-server";
            };

            gpu-screen-recorder = {
                owner = "root";
                group = "root";
                capabilities = "cap_sys_nice+ep";
                source = "${cfg.package}/bin/gpu-screen-recorder";
            };
        };
    };
}
