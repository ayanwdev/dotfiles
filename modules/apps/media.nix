{ pkgs, settings, ... }:
{

  environment.systemPackages = with pkgs; [
    mpv
    pureref
    oculante
    amberol

    spotify

    playerctl
    imagemagick
    ffmpeg
    obs-studio

    spotdl
    gallery-dl
    yt-dlp
  ];
}
