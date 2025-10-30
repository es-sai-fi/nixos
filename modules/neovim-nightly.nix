{ inputs, pkgs, ... }: {
  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlays.default ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
  };
}

