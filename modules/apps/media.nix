{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #spotify
    # vlc
    mpv
    # vpv
    # pureref
    oculante
    amberol
    # audacity

    # (pkgs.callPackage ./spotify-adblock.nix { })
    spotify

    playerctl
    imagemagick
    ffmpeg
    obs-studio
    # lutgen

    spotdl
    gallery-dl
    yt-dlp
  ];
}
