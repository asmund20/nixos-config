-- save, compile, run thun delete binary
vim.keymap.set("n", "<leader>r", [[:w<Enter>:!gcc % -lm<Enter>:!./a.out<Enter>:!rm a.out<CR>]])


-- Set global tab-related options
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
