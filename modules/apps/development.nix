{ pkgs, inputs, ... }:
{
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
  environment.systemPackages = with pkgs; [

    clang
    python312
    go
    nodejs_23
    yarn-berry

    rust-bin.stable.latest.default

    vscode
    android-studio
    android-tools

    ngrok
    pm2

    gnumake
    cmake

    bacon
    nodePackages."nodemon"
    nodePackages."prettier"

    python312Packages."pip"

    tokei
  ];
}
