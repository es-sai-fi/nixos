{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gcc
    wget
    curl
    git
    openssh
    gnupg
    librewolf
    podman-compose
    htop
    lm_sensors
    xwayland-satellite
    discord
    bleachbit
    obs-studio
    obsidian
    gh
    fzf
    bat
    fd
    ripgrep
    unzip
    zip
    jq
    ffmpeg-full
    yazi
    eza
    rustc
    cargo
    python3
    nodejs
  ];

  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };

    nix-ld.enable = true;
    fish.enable = true;
    starship.enable = true;
    zoxide.enable = true;
    niri.enable = true;
  };
}
