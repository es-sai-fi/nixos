{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    REGISTRY_AUTH_FILE = "/home/es-sai-fi/.config/containers/auth.json";
    FZF_DEFAULT_COMMAND = "fd --hidden --strip-cwd-prefix --exclude .git";
    FZF_CTRL_T_COMMAND = "$FZF_DEFAULT_COMMAND";
    FZF_ALT_C_COMMAND = "fd --type=d --hidden --strip-cwd-prefix --exclude .git";
  };
}
