{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./niri
    ./aagl.nix
  ];

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      REGISTRY_AUTH_FILE = "${config.home.homeDirectory}/.config/containers/auth.json";
      FZF_DEFAULT_COMMAND = "fd --hidden --strip-cwd-prefix --exclude .git";
      FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND";
      FZF_ALT_C_COMMAND = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";
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
