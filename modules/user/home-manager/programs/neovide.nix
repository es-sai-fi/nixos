{pkgs, ...}: {
  programs.neovide = {
    enable = true;
    settings = {
      fork = false;
      frame = "full";
      idle = true;
      maximized = false;
      neovim-bin = "${pkgs.neovim}/bin/nvim";
      no-multigrid = false;
      srgb = false;
      tabs = true;
      theme = "auto";
      vsync = true;
      wsl = false;
      font = {
        normal = ["JetBrainsMono Nerd Font Mono"];
        size = 14.0;
      };
    };
  };
}
