-- Tab-greier
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

-- Compile
vim.keymap.set("n", "<leader>r", [[:wa<Enter>:!typst compile %<CR><CR>]])

-- Normal mode preview
vim.keymap.set("n", "<leader>t", ":TypstPreview<CR>")
-- Slide mode preview
vim.keymap.set("n", "<leader>ts", ":TypstPreview slide<CR>")
-- Sync cursor
vim.keymap.set("n", "<leader>tc", ":TypstPreviewSyncCursor<CR>")

vim.opt_local.formatoptions:append("t")
