{
  config,
  pkgs,
  settings,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  networking = {
    hostName = settings.hostname;
    networkmanager.enable = true;
    firewall = rec {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
      ];
      allowedTCPPortRanges = [
        {
          from = 1000;
          to = 9999;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
  time.timeZone = settings.timezone;

  security = {
    rtkit.enable = true;
    sudo.enable = true;
    polkit.enable = true;
  };

  users.users = {
    ${settings.username} = {
      isNormalUser = true;
      description = settings.name;
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "kvm"
        "input"
      ];
      shell = pkgs.fish;
    };
  };

  programs = {
    fish.enable = true;
    git = {
      enable = true;
      config = {
        init.defaultbranch = "main";
        safe.directory = "*";
      };
    };
    nix-ld.enable = true;
  };

  environment.systemPackages = with pkgs; [
    gh # github cli
    killall
    gdu # graphical du
    curl
    wget

    # nix-language essentials
    nixfmt-rfc-style
    nil
    nh
    direnv

    # filesystems
    ntfs3g
    btrfs-progs
    compsize

    # other essentials
    neofetch # most important
    eza # better ls
    bat # better cat
    micro # text editor
    bottom # process monitor thingy
    ripgrep # better grep
    jq # json thingy
    tmux
    p7zip
    fzf
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit settings;
    };
    users.${settings.username} = {
      imports = [
        ../modules/home
      ];
    };
    backupFileExtension = "backup";
  };

  nixpkgs.config.allowUnfree = true;
  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;
  services = {
    displayManager.ly.enable = true;
    udev = {
      enable = true;
      packages = [
        pkgs.via
      ];
    };
  };
  system.stateVersion = "24.05"; # Did you read the comment?
}
