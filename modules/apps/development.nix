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
    python315
    nodejs_24
    yarn-berry

    vscode
    android-studio

    nodePackages."nodemon"
    nodePackages."prettier"
    nodePackages."eas-cli"

    tokei
  ];
}
