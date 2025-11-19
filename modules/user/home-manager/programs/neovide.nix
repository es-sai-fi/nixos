{inputs, ...}: {
  programs.neovide = {
    enable = true;
    settings = {
      fork = false;
      frame = "none";
      idle = true;
      maximized = false;
      neovim-bin = "${inputs.neovim-flake.packages.x86_64-linux.default}/bin/nvim";
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
