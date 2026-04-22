require "nvim-treesitter".setup {
    ensure_installed = { "python", "lua", "typst", "markdown_inline", "markdown" },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
    }
}
