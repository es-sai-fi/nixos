{pkgs, ...}: {
  environment.systemPackages = [pkgs.vagrant];
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = ["user-with-access-to-virtualbox"];
  users.users.es-sai-fi.extraGroups = ["docker" "vboxusers"];
}
