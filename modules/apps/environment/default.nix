{ inputs, pkgs, ... }:
{
  imports = [
    ./hyprland/default.nix
    ./xdg.nix
    ./fonts.nix
  ];
}
