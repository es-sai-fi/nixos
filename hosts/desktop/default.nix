{
  imports = [./hardware-configuration.nix];

  networking.hostName = "nixos";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  system.stateVersion = "25.05";
}
