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

  users.users.asmund.packages = with pkgs; [
    prismlauncher
  ];

  my.hyprlock.enableFingerprint = true;
}
