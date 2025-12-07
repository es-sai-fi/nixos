{
  inputs,
  pkgs,
  ...
}: {
  programs.neovide = {
    enable = true;
    settings = {
      fork = true;
      frame = "none";
      idle = true;
      maximized = false;
      neovim-bin = "${inputs.neovim-flake.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/nvim";
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
