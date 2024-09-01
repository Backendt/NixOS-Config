{
    description = "First NixOS system flake";


    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        
        home-manager.url = "github:nix-community/home-manager/release-24.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        stylix.url = "github:danth/stylix";
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, stylix, ... }@inputs:
    let
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
                    stylix.nixosModules.stylix
                    ./presets/hyprland-desktop/systemConfig.nix
                ];
            };

        };

        # Home config
        homeConfigurations = {
            mat = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${system}; 
                modules = [
                    stylix.homeManagerModules.stylix
                    ./presets/hyprland-desktop/userConfig.nix
                ];
            };
        };
    };
}
