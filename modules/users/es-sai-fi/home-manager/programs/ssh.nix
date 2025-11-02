{
  programs.ssh = {
    enable = true;
    startAgent = true;
    matchBlocks = {
      github = {
        host = "github.com";
        hostname = "github.com";
        user = "git";
        identityFile = [ "~/.ssh/id_ed25519" ];
        identitiesOnly = true;
        addKeysToAgent = true;
      };
    };
  };
}
