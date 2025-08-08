{
  pkgs,
  settings,
  inputs,
  ...
}:
{
  hardware = {
    graphics = {
      enable = true;
      package = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.mesa;
    };
  };
}
