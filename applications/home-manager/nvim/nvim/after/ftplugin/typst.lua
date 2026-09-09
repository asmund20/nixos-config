-- Tab-greier
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Compile
vim.keymap.set("n", "<leader>r", [[:wa<Enter>:!typst compile %<CR><CR>]])

vim.opt_local.formatoptions:append("t")

vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.textwidth = 0

vim.opt_local.spelllang = 'en_us'
vim.opt_local.spell = true
