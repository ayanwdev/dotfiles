{
  pkgs,
  inputs,
  settings,
  lib,
  ...
}:
{
  programs.java.enable = true;

  environment.systemPackages = with pkgs; [

    codex
    llama-cpp-vulkan

    clang
    python314
    nodejs_24
    javaPackages.compiler.openjdk21

    yarn-berry

    vscode

    nodemon
    prettier
    eas-cli

    tokei
  ];
}
