{
  pkgs,
  inputs,
  settings,
  ...
}:
{

  services = {
    blueman.enable = true;
  };

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
    ungoogled-chromium
    vesktop
    qbittorrent
    motrix
    gparted
    resources
    baobab
    trash-cli
    libnotify
    file-roller
    nautilus
    android-tools
    gping
    glow
    cloudflare-warp
  ];
}
