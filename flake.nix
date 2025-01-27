{
    description = "First NixOS system flake";


    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.11";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim = {
            url = "github:nix-community/nixvim/nixos-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        stylix.url = "github:danth/stylix/release-24.11";
    };

    outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
        current-preset = ./presets/hyprland-poimandres;

        system = "x86_64-linux";
        overlay-unstable = final: prev: { # Make an overlay for nixpkgs-unstable, allowing unfree packages
            unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
            };
        };
    in {
        # System config
        nixosConfigurations = {
            
            # Desktop computer
            nixos-desktop = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [
                    # Make unstable packages accessible with pkgs.unstable
                    ({config, pkgs, ...}: { nixpkgs.overlays = [overlay-unstable]; })
                    # Preset config
                    (current-preset + "/desktop/system-configuration.nix")
                ];
            };

            # Laptop
            nixos-laptop = nixpkgs.lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [
                    # Make unstable packages accessible with pkgs.unstable
                    ({config, pkgs, ...}: { nixpkgs.overlays = [overlay-unstable]; })
                    # Preset config
                    (current-preset + "/laptop/system-configuration.nix")
                ];
            };

        };

        # Home config
        homeConfigurations = {
            "mat@nixos-desktop" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${system}; 
                extraSpecialArgs = { inherit inputs; };
                modules = [
                    # Make unstable packages accessible with pkgs.unstable
                    ({config, pkgs, ...}: { nixpkgs.overlays = [overlay-unstable]; })
                    # Preset config
                    (current-preset + "/desktop/home-configuration.nix")
                ];
            };

            "mat@nixos-laptop" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${system}; 
                extraSpecialArgs = { inherit inputs; };
                modules = [
                    # Make unstable packages accessible with pkgs.unstable
                    ({config, pkgs, ...}: { nixpkgs.overlays = [overlay-unstable]; })
                    # Preset config
                    (current-preset + "/laptop/home-configuration.nix")
                ];
            };
        };
    };
}
