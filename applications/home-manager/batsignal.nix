{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libnotify
  ];
  services.mako.enable = true;
  services.batsignal.enable = true;
}
