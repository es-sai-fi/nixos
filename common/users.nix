{inputs, ...}: {
  users.users.es-sai-fi = {
    isNormalUser = true;
    description = "es-sai-fi";
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
    ];
    packages = [];
  };

  hjem = {
    extraModules = [
      inputs.hjem-rum.hjemModules.default
    ];
    users.es-sai-fi = {
      enable = true;
      directory = "/home/es-sai-fi";
      user = "es-sai-fi";
    };
    clobberByDefault = true;
  };
}
