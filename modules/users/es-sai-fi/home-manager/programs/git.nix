{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "es-sai-fi";
        email = "96452903+es-sai-fi@users.noreply.github.com";
      };
      programs.git.delta.enable = true;
      init.defaultBranch = "main";
      color.ui = "auto";
      pull.rebase = false;
      push.autoSetupRemote = true;
    };
  };
}
