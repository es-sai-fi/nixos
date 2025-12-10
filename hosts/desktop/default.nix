{
  imports = [./hardware-configuration.nix ./graphics.nix];

  networking.hostName = "seer";

  system.stateVersion = "25.05";
}
