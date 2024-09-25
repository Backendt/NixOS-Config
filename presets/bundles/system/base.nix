{ config, pkgs, inputs, ... }:

{
    #
    #   SYSTEM
    #

    # Systemd-boot bootloader
    boot = {
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
        tmp.cleanOnBoot = true;
    };

    # Enable networking
    networking.networkmanager.enable = true;

    # Locale stuff
    time.timeZone = "Europe/Paris";
    i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
            LC_ADDRESS = "fr_FR.UTF-8";
            LC_IDENTIFICATION = "fr_FR.UTF-8";
            LC_MEASUREMENT = "fr_FR.UTF-8";
            LC_MONETARY = "fr_FR.UTF-8";
            LC_NAME = "fr_FR.UTF-8";
            LC_NUMERIC = "fr_FR.UTF-8";
            LC_PAPER = "fr_FR.UTF-8";
            LC_TELEPHONE = "fr_FR.UTF-8";
            LC_TIME = "fr_FR.UTF-8";
        };
    };

    # Set french keyboard
    # On X11
    services.xserver.xkb = {
        layout = "fr";
        variant = "";
    };
    # In console
    console.keyMap = "fr";

    # Disable mouse acceleration in X11
    services.libinput.mouse.accelProfile = "flat";

    # Create user
    users.users.mat = {
        isNormalUser = true;
        description = "mat";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    # Enable Flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # System version
    system.stateVersion = "24.05";

    #
    #   PACKAGES
    #

    imports = [ ../../../modules/system/doas.nix ];

    # Allow unfree packages (Forgive me Richard)
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        git
        doas
        wget
        samba
        libnotify
        killall
        pfetch-rs
        ntfs3g # Used to mount NTFS
    ];

    fonts.packages = with pkgs; [
        material-icons
        nerdfonts
    ];

}
