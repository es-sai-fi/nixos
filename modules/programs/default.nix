{pkgs, ...}: {
  imports = [
    ./niri
    ./aagl.nix
  ];

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
  ];

  programs = {
    dconf.enable = true;
  };
}
