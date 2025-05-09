{ pkgs, inputs, ... }:
{

  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.prismlauncher.packages.${pkgs.system}.prismlauncher
    xclicker
  ];
}
