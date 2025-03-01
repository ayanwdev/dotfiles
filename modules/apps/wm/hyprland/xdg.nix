{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
      #      xdg-desktop-portal-hyprland
    ];
    config = {
      common = {
        default = "hyprland";
      };
    };
  };

  environment.systemPackages = [
    pkgs.xdg-utils
  ];
}
