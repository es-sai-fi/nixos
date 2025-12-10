{pkgs, ...}: let
  gitIni = pkgs.formats.gitIni {};
  gitConfig = gitIni.generate "git-config" {
    init.defaultBranch = "main";
    pull.rebase = false;
    push.autoSetupRemote = true;
    user = {
      email = "96452903+es-sai-fi@users.noreply.github.com";
      name = "es-sai-fi";
    };
  };
  git-wrapped = pkgs.symlinkJoin {
    name = "git-wrapped";
    paths = [
      pkgs.git
    ];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      mkdir -p $out/git
      cp ${gitConfig} $out/git/config

      wrapProgram $out/bin/hx \
        --set XDG_CONFIG_HOME $out
    '';
  };
in {
  programs.git = {
    enable = true;
    package = git-wrapped;
  };
}
