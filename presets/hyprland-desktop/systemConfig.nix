{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/system/doas.nix
      ../../modules/system/nvidia.nix
      ../../modules/system/hyprland.nix
      ../../modules/system/gaming.nix
      ../../modules/system/replay.nix
      ../../modules/system/pipewire/desktop-pipewire.nix
    ];

  # Replay
  programs.gpu-screen-recorder-replay = {
    enable = true;
    monitor = "DP-1";
    videoPath = "~/Videos/Replays";
    autostart = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Define a user account
  users.users.mat = {
    isNormalUser = true;
    description = "mat";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages (Forgive me Richard)
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    doas
    wget
    samba
    neovim
    git
    libnotify
    killall
    pfetch-rs
    ntfs3g # Used to mount NTFS
  ];

  # Fonts
  fonts.packages = with pkgs; [
    material-icons
    nerdfonts
  ];

  # Mouse
  services.libinput.mouse.accelProfile = "flat";

  system.stateVersion = "24.05";
}
