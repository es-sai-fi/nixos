{
  imports = [
    ./fish.nix
    ./fuzzel.nix
    ./gh.nix
    ./alacritty.nix
    ./git.nix
    ./waybar.nix
    ./yazi.nix
    ./zellij.nix
    ./neovim-nightly.nix
    ./niri.nix
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
