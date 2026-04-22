{ pkgs, ... }:
{
  programs.git.enable = true;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      lsp-zero-nvim
      nvim-lspconfig
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
    haskell-language-server
    fourmolu
  ];
}
