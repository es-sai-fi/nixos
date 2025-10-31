{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [
        20
        80
        443
      ];
      allowedUDPPorts = [ ];
    };
  };
}
