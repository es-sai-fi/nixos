{ inputs, lib, ... }:
{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak = {
    remotes = lib.mkOptionDefault [ ];
    update.auto.enable = false;
    uninstallUnmanaged = true;

    packages = [
      "org.vinegarhq.Sober"
    ];
  };
}
