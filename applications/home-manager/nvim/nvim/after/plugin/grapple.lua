local grapple = require("grapple")

vim.keymap.set("n", "<leader>a", grapple.toggle())
vim.keymap.set("n", "<c-e>", grapple.toggle_loaded())

vim.keymap.set("n", "<c-1>", grapple.select(index=1))
