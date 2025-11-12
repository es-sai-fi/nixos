{
  imports = [
    ./fish.nix
    ./gh.nix
    ./alacritty.nix
    ./git.nix
    ./yazi.nix
    ./zellij.nix
    ./neovim-nightly.nix
    ./librewolf.nix
    ./niri.nix
    ./dankMaterialShell.nix
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
    gcc.enable = true;
  };
}
