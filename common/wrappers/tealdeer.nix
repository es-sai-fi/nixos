{pkgs}: let
  toml = pkgs.formats.toml {};
  tealdeerConfigFile = toml.generate "tealdeer-config.toml" {
    display.use_pager = true;
    updates.auto_update = true;
  };
in
  pkgs.symlinkJoin {
    name = "tealdeer-wrapped";
    paths = [pkgs.tealdeer];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      mkdir $out/tealdeer
      cp ${tealdeerConfigFile} $out/tealdeer/config.toml

      wrapProgram $out/bin/tldr \
        --set TEALDEER_CONFIG_DIR $out/tealdeer
    '';
    meta.mainProgram = "tldr";
  }
