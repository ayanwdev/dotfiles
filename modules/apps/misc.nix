{
  pkgs,
  inputs,
  settings,
  ...
}:
{

  services.blueman.enable = true;
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-devedition;
    };
    kdeconnect = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vesktop
    qbittorrent
    motrix
    gparted
    resources
    cloudflare-warp
    floorp-bin
    baobab
    trash-cli
    libnotify
    chromium
    file-roller
    bluetui
    nautilus
    android-tools
  ];
}
