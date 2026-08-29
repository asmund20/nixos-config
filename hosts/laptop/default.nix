{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../common
  ];

  networking.hostName = "asmund-nixos-laptop";

  my.hyprlock.enableFingerprint = true;
}
