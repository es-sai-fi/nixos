{pkgs}: {
  programs.fish = {
    enable = true;
    package = import ../wrappers/fish {inherit pkgs;};
    useBabelFish = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      cd = "z";
      cat = "bat";
    };
  };
}
