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
    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };

    dconf.enable = true;
  };
}
