{pkgs}: let
  gitIni = pkgs.formats.gitIni {};
  gitConfigFile = gitIni.generate "git-config" {
    init.defaultBranch = "main";
    pull.rebase = false;
    push.autoSetupRemote = true;
    user = {
      email = "96452903+es-sai-fi@users.noreply.github.com";
      name = "es-sai-fi";
    };
  };
in {
  gitWrapped = pkgs.symlinkJoin {
    name = "git-wrapped";
    paths = [
      pkgs.git
    ];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      mkdir -p $out/git
      cp ${gitConfigFile} $out/git/config

      wrapProgram $out/bin/git \
        --set XDG_CONFIG_HOME $out
    '';
  };
}
