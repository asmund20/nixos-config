{ pkgs, ... }:
{
  networking.wireless.iwd = {
    enable = true;
    IPv6.Enabled = true;
    settings.AutoConnect = true;
  };

  users.users.asmund.packages = with pkgs; [
    impala
  ];
}
