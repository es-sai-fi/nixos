{pkgs}:
pkgs.wrapFirefox pkgs.firefox-unwrapped {
  extraPolicies = {};
  nixExtensions = [
  ];
}
