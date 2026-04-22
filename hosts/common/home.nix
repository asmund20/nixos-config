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

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
