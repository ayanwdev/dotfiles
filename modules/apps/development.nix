{
  pkgs,
  inputs,
  settings,
  ...
}:
{
  programs.java.enable = true;
  environment.systemPackages = with pkgs; [

    clang
    python312
    # go
    nodejs_24
    yarn-berry
    # inputs.blender.packages.${settings.system}.blender_4_4
    # rust-bin.stable.latest.default

    vscode
    waydroid
    krita

    gnumake
    cmake

    bacon
    nodePackages."nodemon"
    nodePackages."prettier"
    # nodePackages."eas-cli"

    python312Packages."pip"

    tokei
  ];
}
