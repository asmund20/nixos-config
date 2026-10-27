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
      vim-lark-syntax

      (nvim-treesitter.withPlugins (
        parsers: with parsers; [
          nix
          python
          typst
          rust
        ]
      ))
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
    basedpyright
    ruff

    ripgrep
  ];

  # The actual config
  home.file.".config/nvim".source = ./nvim;
}
