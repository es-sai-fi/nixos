{
  lib,
  pkgs,
}: let
  toml = pkgs.formats.toml {};
  yaziConfigFile = toml.generate "yazi-config.toml" {
    mgs = {
      show_hidden = true;
      sort_by = "mtime";
      sort_dir_first = true;
      sort_reverse = true;
    };
  };
  yaziThemeFile = toml.generate "yazi-theme.toml" {
    flavor.dark = "gruvbox";
  };
  extraPackages = with pkgs; [jq fd fzf ripgrep zoxide _7zz wl-clipboard];
in
  pkgs.symlinkJoin {
    name = "yazi-wrapped";
    paths = [pkgs.yazi];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      mkdir $out/yazi
      cp ${yaziConfigFile} $out/yazi/yazi.toml
      cp ${yaziThemeFile} $out/yazi/theme.toml
      ln -s {./flavors} $out/yazi/flavors

      wrapProgram $out/bin/yazi \
        --prefix PATH : ${lib.makeBinPath extraPackages} \
        --set YAZI_CONFIG_HOME $out/yazi
    '';
  }
