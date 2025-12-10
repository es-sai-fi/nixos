{pkgs, ...}: {
  programs.git = {
    enable = true;
  };

  hjem.users.es-sai-fi.xdg.config.files."git/config" = let
    gitIni = pkgs.formats.gitIni {};
    settings = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
      user = {
        email = "96452903+es-sai-fi@users.noreply.github.com";
        name = "es-sai-fi";
      };
    };
  in {
    source = gitIni.generate "git-config" settings;
  };
}
