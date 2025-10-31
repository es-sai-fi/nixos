{ inputs, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Nix settings.
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Boot.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.tmp.cleanOnBoot = true;

  # Latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";

  # Networking.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Bogota";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CO.UTF-8";
    LC_IDENTIFICATION = "es_CO.UTF-8";
    LC_MEASUREMENT = "es_CO.UTF-8";
    LC_MONETARY = "es_CO.UTF-8";
    LC_NAME = "es_CO.UTF-8";
    LC_NUMERIC = "es_CO.UTF-8";
    LC_PAPER = "es_CO.UTF-8";
    LC_TELEPHONE = "es_CO.UTF-8";
    LC_TIME = "es_CO.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "es";

  # User configuration.
  users.users.es-sai-fi = {
    isNormalUser = true;
    description = "es-sai-fi";
    extraGroups = [ "networkmanager" "wheel" "podman" ];
    packages = with pkgs; [];
  };

  home-manager.users.es-sai-fi = { pkgs, ... }: {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/about" = "librewolf.desktop";
        "x-scheme-handler/unknown" = "librewolf.desktop";
        "application/pdf" = "librewolf.desktop";
      };
    };

    home.packages = with pkgs; [  
      wl-clipboard
      wlsunset
      swaybg
      waybar

      statix
      nixfmt
    ];

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };

    programs.fzf.enable = true;
    programs.ripgrep.enable = true;
    programs.eza.enable = true;
    programs.alacritty.enable = true;
    programs.zellij.enable = true;
    programs.fuzzel.enable = true;

    services.mako.enable = true;

    home.stateVersion = "25.05";
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "es-sai-fi";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Packages installed in the system profile.
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
   
  # Fonts.
  fonts.packages = with pkgs; [
     nerd-fonts.jetbrains-mono
  ];

  # Podman.
  virtualisation = {
     containers.enable = true;
     podman = {
       enable = true;
       dockerCompat = true;
       defaultNetwork.settings.dns_enabled = true;
     };
  };

  # Programs.
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];  
  };
  programs.nix-ld.enable = true;
  programs.fish.enable = true;
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.niri.enable = true;

  # Services.
  services.gnome.gnome-keyring.enable = true;
  services.flatpak.enable = true;
  
  # Firewall.
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 20 80 443 ];
  networking.firewall.allowedUDPPorts = [];
  
  # Security.
  security.apparmor.enable = true;
  security.polkit.enable = true;
  security.sudo.enable = false;
  security.sudo-rs.enable = true;

  # Session variables.
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  system.stateVersion = "25.05";
}
