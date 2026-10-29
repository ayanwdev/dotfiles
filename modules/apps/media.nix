{ pkgs, settings, ... }:
{

  environment.systemPackages = with pkgs; [
    mpv
    anime4k

    spotify
    oculante
    amberol

    playerctl
    imagemagick
    ffmpeg
    obs-studio

    gallery-dl
    yt-dlp
  ];
}
