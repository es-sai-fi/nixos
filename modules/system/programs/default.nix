{pkgs, ...}: {
  imports = [
    ./niri
    ./aagl.nix
  ];

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      REGISTRY_AUTH_FILE = "/home/es-sai-fi/.config/containers/auth.json";
      FZF_DEFAULT_COMMAND = "fd --type f --color always --exclude .git --ignore-file ~/.gitignore";
      FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND";
      FZF_ALT_C_COMMAND = "fd --type d --color always --exclude .git --ignore-file ~/.gitignore";
    };
    systemPackages = with pkgs; [
      curl
      git
      openssh
      wget

      bleachbit
      lm_sensors
      tealdeer
      unzip
      xdg-utils
      zip

      ffmpeg-full
      obs-cmd
      obs-studio
      mpv

      discord

      minizinc
    ];
  };

  programs = {
    dconf.enable = true;
  };
}
