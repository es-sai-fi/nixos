{ pkgs, inputs, ... }:
{
  imports = [
    ./aagl.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
    inputs.neovim-flake.packages.x86_64-linux.default
  ];

  programs = {
    nix-ld.enable = true;
    dconf.enable = true;
  };
}
