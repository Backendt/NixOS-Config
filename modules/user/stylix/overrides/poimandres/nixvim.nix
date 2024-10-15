{ config, pkgs, ... }:

{
    stylix.targets.nixvim.enable = false;
    programs.nixvim.colorscheme.poimandres.enable = true;
}
