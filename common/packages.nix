{pkgs, ...}: {
  environment = {
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

  fonts.packages = with pkgs; [nerd-fonts.jetbrains-mono];

  programs = {
    dconf.enable = true;
  };
}
