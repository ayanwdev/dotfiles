{
  description = "AyanW's Nix Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable-nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    hyprland.url = "github:hyprwm/Hyprland";
    rust-overlay.url = "github:oxalica/rust-overlay";
    blender.url = "github:edolstra/nix-warez?dir=blender";
    # prismlauncher.url = "github:ayanwdev/PrismLauncher-Cracked";
  };
  outputs =
    {
      self,
      nixpkgs,
      stable-nixpkgs,
      home-manager,
      hyprland,
      rust-overlay,
      blender,
    # prismlauncher,
    }@inputs:
    let
      settings = import ./settings.nix;
      system = settings.system;
      pkgs = nixpkgs.legacyPackages.${system};
      stable-pkgs = stable-nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {

        ${settings.hostname} = nixpkgs.lib.nixosSystem {
          modules = [

            # main configruation
            ./required/configuration.nix

            # modules
            ./modules/boot
            ./modules/i18n
            ./modules/audio
            ./modules/apps
            ./modules/openssh
            ./modules/systemd

          ];

          specialArgs = {
            inherit settings;
            inherit inputs;
            inherit stable-pkgs;
          };
        };
      };
    };
}
