{pkgs, ...}: {
  environment = {
    systemPackages = [pkgs.fzf];
    variables = {
      FZF_DEFAULT_COMMAND = "fd --type f --color always --exclude .git --ignore-file ~/.gitignore";
      FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND";
      FZF_ALT_C_COMMAND = "fd --type d --color always --exclude .git --ignore-file ~/.gitignore";
    };
  };
}
