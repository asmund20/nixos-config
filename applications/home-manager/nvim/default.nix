{ pkgs, ... }:
{
  imports = [
    ./haskell.nix
  ];
  programs.git.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-cmp
      cmp-nvim-lsp
      nvim-treesitter.withAllGrammars
      harpoon2
      catppuccin-nvim
      typst-preview-nvim
      autoclose-nvim
      telescope-nvim
      conform-nvim
      nvim-surround
    ];
  };

  # lsps and other neovim depenencies
  home.packages = with pkgs; [
    nil
    nixfmt
    tinymist
    websocat
    jdt-language-server
  ];

  # The actual config
  home.file.".config/nvim".source = ./nvim;
}
