{pkgs, ...}: {
  programs.alacritty = {
    enable = true;
  };

  hjem.users.es-sai-fi.xdg.config.files."alacritty/alacritty.toml" = let
    toml = pkgs.formats.toml {};
    settings = {
      general.import = ["${pkgs.alacritty-theme}/share/alacritty-theme/tokyo_night_storm.toml"];
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
  in {
    source = toml.generate "alacritty.toml" settings;
  };
}
