{
  imports = [
    ../../scripts
    ../../applications/home-manager/batsignal.nix
    ../../applications/home-manager/fourmolu.nix
    ../../applications/home-manager/ghostty.nix
    ../../applications/home-manager/git.nix
    ../../applications/home-manager/gtk.nix
    ../../applications/home-manager/hypr
    ../../applications/home-manager/nushell
    ../../applications/home-manager/nvim
    ../../applications/home-manager/waybar
    ../../applications/home-manager/zen.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "asmund";
  home.homeDirectory = "/home/asmund";

  home.stateVersion = "26.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
