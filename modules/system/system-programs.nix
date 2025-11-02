{ pkgs, ... }:
{
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

    nix-ld.enable = true;
    dconf.enable = true;
  };

}
