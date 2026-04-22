vim.opt.guicursor = ""

-- line-numbers
vim.opt.nu = true
vim.opt.relativenumber = true

--Tab-stuff
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.textwidth = 80

vim.opt.formatoptions:remove("t")
vim.opt.formatoptions:append("cqj")

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
