{
  imports = [
    ./fish.nix
    ./gh.nix
    ./alacritty.nix
    ./git.nix
    ./yazi.nix
    ./zellij.nix
    ./librewolf.nix
    ./dankMaterialShell.nix
    ./neovide.nix
  ];

  programs = {
    fzf.enable = true;
    ripgrep.enable = true;
    eza.enable = true;
    starship.enable = true;
    zoxide.enable = true;
    bat.enable = true;
    fd.enable = true;
    jq.enable = true;
    htop.enable = true;
  };
}
