{pkgs}: let
  toml = pkgs.formats.toml {};
  alacrittyConfigFile = toml.generate "alacritty-config.tml" {
    general.import = ["${pkgs.alacritty-theme}/share/alacritty-theme/gruvbox_material_medium_dark.toml"];
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
in
  pkgs.symlinkJoin {
    name = "alacritty-wrapped";
    paths = [pkgs.alacritty];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      mkdir $out/alacritty
      cp ${alacrittyConfigFile} $out/alacritty/alacritty.toml

      wrapProgram $out/bin/alacritty \
        --add-flags  "--config-file $out/alacritty/alacritty.toml"
    '';
    meta.mainProgram = "alacritty";
  }
