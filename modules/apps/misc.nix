{
  pkgs,
  inputs,
  settings,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vesktop
    qbittorrent
    motrix
    gparted
    floorp
    resources
    cloudflare-warp
  ];
}
