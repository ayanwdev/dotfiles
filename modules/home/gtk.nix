{ pkgs, ... }:
{
  gtk = {
    enable = true;
    font.name = "FantasqueSansM Nerd Font";
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyo-night-gtk;
    };
    cursorTheme = {
      name = "Bibata-Original-Ice";
      package = pkgs.bibata-cursors;
    };
  };
}
