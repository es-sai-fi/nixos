{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    theme = "tokyo_night_storm";
    settings = {
      window = {
        opacity = 0.9;
        decorations = "none";
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "regular";
        };
        size = 13;
      };
      terminal.shell = "${pkgs.fish}/bin/fish";
    };
  };
}
