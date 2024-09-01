{ config, pkgs, ... }:

{
    programs.bash = {
        enable = true;
        shellAliases = {
            la = "ls -lA";
            nixclean = "doas nix-collect-garbage -d";
            nixbuild = "doas nixos-rebuild switch --flake ~/.dotfiles/";
            nixtest = "echo 'WARNING: This build is not persistent'; doas nixos-rebuild test --flake ~/.dotfiles/";
            homebuild = "home-manager switch --flake ~/.dotfiles/";
            homeclean = "home-manager expire-generations now";
            update = "nix flake update ~/.dotfiles/";
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
