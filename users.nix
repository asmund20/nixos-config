{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.asmund = {
    isNormalUser = true;
    description = "Åsmund";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users = {
      "asmund" = import ../../home.nix;
    };
  };
}
