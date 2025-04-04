{
  pkgs,
  inputs,
  settings,
  ...
}:
{
  nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
  environment.systemPackages = with pkgs; [

    clang
    python312
    go
    nodejs_23
    yarn-berry
    inputs.blender.packages.${settings.system}.blender_4_4

    rust-bin.stable.latest.default

    vscode
    android-studio
    android-tools

    ngrok

    gnumake
    cmake

    bacon
    nodePackages."nodemon"
    nodePackages."prettier"

    python312Packages."pip"

    tokei
  ];
}
