{
  users.mutableUsers = false;

  users.users.es-sai-fi = {
    isNormalUser = true;
    description = "es-sai-fi";
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
    ];
  };
}
