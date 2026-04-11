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

  networking.hostName = "asmund nixos desktop";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
