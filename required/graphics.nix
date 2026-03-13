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
        intel-media-driver
        intel-compute-runtime
        vpl-gpu-rt
        libvdpau-va-gl
        #
        clinfo
      ];
    };
  };
}
