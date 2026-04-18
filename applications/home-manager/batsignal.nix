{ pkgs, ... }:
{
  imports = [
    ./mako.nix
  ];
  home.packages = with pkgs; [
    libnotify
  ];
  services.batsignal.enable = true;
}
