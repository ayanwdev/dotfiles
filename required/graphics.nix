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
      extraPackages = with pkgs; [
        vpl-gpu-rt
        intel-compute-runtime
        level-zero
      ];
    };
  };
}
