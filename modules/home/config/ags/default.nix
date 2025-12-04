{ inputs, pkgs, ... }:
{
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;
    configDir = "$XDG_CONFIG_HOME/ags";
  };

  home.packages = [ inputs.astal.packages.${pkgs.system}.notifd ];
}
