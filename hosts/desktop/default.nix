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

  boot.loader.limine = {
    secureBoot.enable = true;
    extraEntries = ''
      /Windows
      comment: Windows
      protocol: efi
      image_path: guid(d6c351ce-c388-42eb-bdcc-c70bef8e10bf):/EFI/Microsoft/Boot/bootmgfw.efi
    '';

  };

  networking.hostName = "asmund-nixos-desktop";

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  my.hyprlock.enableFingerprint = false;
}
