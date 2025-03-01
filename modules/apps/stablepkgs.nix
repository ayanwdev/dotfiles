{ stable-pkgs, ... }:
{
  environment.systemPackages = [
    stable-pkgs.nodePackages."eas-cli"
  ];
}
