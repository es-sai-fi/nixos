{ pkgs, ... }:
{
  imports = [
    ./aagl.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
  ];

  programs = {
    nix-ld.enable = true;
    dconf.enable = true;
  };
}
