{
  pkgs,
  inputs,
  settings,
  ...
}:
{
  #nixpkgs.overlays = [ inputs.rust-overlay.overlays.default ];
  programs.java.enable = true;
  environment.systemPackages = with pkgs; [

    clang
    python312
    go
    kotlin
    nodejs_24
    yarn-berry
    inputs.blender.packages.${settings.system}.blender_4_4

    #rust-bin.stable.latest.default

    obsidian
    vscode
    android-studio
    # jetbrains.idea-community
    postman

    # ngrok

    gnumake
    cmake
    gradle

    bacon
    nodePackages."nodemon"
    nodePackages."prettier"
    # nodePackages."eas-cli"

    python312Packages."pip"

    tokei
  ];
}
