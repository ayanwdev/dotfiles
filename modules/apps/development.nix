{
  pkgs,
  inputs,
  settings,
  lib,
  ...
}:
{
  programs.java.enable = true;

  virtualisation.docker = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [

    obsidian

    llama-cpp-vulkan

    clang
    python314
    nodejs_24
    javaPackages.compiler.openjdk21

    yarn-berry
    bun

    vscode

    antigravity-cli
    agent-browser
    opencode

    nodemon
    prettier

    eas-cli
    firebase-tools

    tokei

  ];
}
