{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;
        userName = "Backendt";
        userEmail = "matisse.beckandt@proton.me";
        extraConfig = {
            init.defaultBranch = "main";
            pull.rebase = true;
        };
    };
}
