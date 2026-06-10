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
      extraPackages = with pkgs; [ ];
    };
  };

  environment.systemPackages = with pkgs; [

    vulkan-loader
    vulkan-tools
    vulkan-headers

    intel-media-driver
    intel-compute-runtime
    vpl-gpu-rt
    libvdpau-va-gl

  ];
}
