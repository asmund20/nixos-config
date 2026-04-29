{ pkgs, ... }:
{
  home.packages = with pkgs; [
    haskell-language-server
    fourmolu
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
    ];
  };
  home.file.".config/nvim/after/plugin/haskell.lua".text = /* lua */ ''
    vim.lsp.enable("hls")
    vim.lsp.config("hls", {
        cmd = { "haskell-language-server-wrapper", "--lsp" },
        filetypes = { "haskell", "lhaskell" },
        root_markers = { "cabal.project", "cabal.project.local", "*.cabal", "stack.yaml", ".git" },
        settings = {
            haskell = {
                formattingProvider = "formolu",
            },
        },
    })

  '';
}
