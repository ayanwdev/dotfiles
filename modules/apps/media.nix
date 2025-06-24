{ pkgs, settings, ... }:
{

  services.syncthing = {
    enable = true;
    user = settings.username;
    openDefaultPorts = true;
    dataDir = "/home/${settings.username}/.config/syncthing";
    settings = {
      gui = {
        theme = "black";
      };
    };
  };

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
