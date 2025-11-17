{inputs, ...}: {
  programs.neovim = {
    finalPackage = inputs.neovim-flake.packages.x86_64-linux.default;
    defaultEditor = true;
  };
}
