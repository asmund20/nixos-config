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
      nvim-cmp
      cmp-nvim-lsp
      grapple-nvim
      catppuccin-nvim
      typst-preview-nvim
      autoclose-nvim
      telescope-nvim
      conform-nvim
      nvim-surround
      nvim-treesitter-parsers.nix
      nvim-treesitter-parsers.python
      nvim-treesitter-parsers.typst
      nvim-treesitter-parsers.rust
    ];
  };

  # lsps and other neovim depenencies
  home.packages = with pkgs; [
    nil
    nixfmt
    tinymist
    typstyle
    websocat
    rust-analyzer
  ];

  # The actual config
  home.file.".config/nvim".source = ./nvim;
}
