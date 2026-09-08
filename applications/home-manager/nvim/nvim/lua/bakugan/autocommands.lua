vim.api.nvim_create_autocmd("BufEnter", {
    callback = function(args)
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
end,
})
