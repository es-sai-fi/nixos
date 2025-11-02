{
  home-manager.users.es-sai-fi =
    { pkgs, config, ... }:
    {
      imports = [
        ./programs
        ./services
      ];

      nixpkgs.config.allowUnfree = true;

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

      home = {
        packages = with pkgs; [
          wl-clipboard
          swaybg
          statix
          nixfmt
          rustc
          cargo
          python3
          nodejs
          lm_sensors
          zip
          unzip
          openssh
          ffmpeg-full
          obsidian
          obs-studio
          bleachbit
          discord
          xwayland-satellite
          obs-cmd
          nautilus
          xdg-utils
        ];
        sessionVariables = {
          NIXOS_OZONE_WL = "1";
          REGISTRY_AUTH_FILE = "${config.home.homeDirectory}/.config/containers/auth.json";
          EDITOR = "nvim";
          VISUAL = "nvim";
          FZF_DEFAULT_COMMAND = "fd --hidden --strip-cwd-prefix --exclude .git";
          FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND";
          FZF_ALT_C_COMMAND = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";
        };
        stateVersion = "25.05";
        shell.enableFishIntegration = true;
      };
      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };
    };
}
