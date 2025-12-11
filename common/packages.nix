{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      curl
      git
      openssh
      wget

      lm_sensors
      tealdeer
      unzip
      xdg-utils
      zip
      ripgrep
      eza
      fd
      jq
      wl-clipboard

      ffmpeg-full
      obs-cmd
      obs-studio
      mpv
    ];
  };

  fonts.packages = [pkgs.nerd-fonts.jetbrains-mono];
}
