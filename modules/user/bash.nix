{ config, pkgs, ... }:

let
    flakeDirectory = "~/.dotfiles/";
in {
    programs.bash = {
        enable = true;
        shellAliases = {
            la = "ls -lA";
            nixclean = "doas nix-collect-garbage -d";
            nixbuild = "doas nixos-rebuild switch --flake ${flakeDirectory}";
            nixtest = "echo 'WARNING: This build is not persistent'; doas nixos-rebuild test --flake ${flakeDirectory}";
            homebuild = "home-manager switch --flake ${flakeDirectory} -b old";
            homeclean = "home-manager expire-generations now";
            update = "doas nix flake update --flake ${flakeDirectory} && nix flake update --flake ${flakeDirectory} && echo 'Done ! Please rebuild NixOS.'";
        };

        historyIgnore = [
            "ls"
            "la"
            "cd"
            "exit"
        ];

        bashrcExtra = ''
            bind '"\e[A":history-search-backward'
            bind '"\e[B":history-search-forward'
            green=$(tput setaf 2)
            reset_color=$(tput sgr0)
            PS1='\W/\[$green\]-> \[$reset_color\]'
        '';
    };
}
