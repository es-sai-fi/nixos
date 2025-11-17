{inputs, ...}: {
  programs.neovim = {
    enable = true;
    pkg = inputs.neovim-flake.packages.x86_64-linux.default;
    defaultEditor = true;
  };
}
