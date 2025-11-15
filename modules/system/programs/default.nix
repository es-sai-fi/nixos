{pkgs, ...}: {
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
    dconf.enable = true;
  };
}
