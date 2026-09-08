local grapple = require("grapple")

grapple.setup({
    icons = false,
    status = false,
})

vim.keymap.set("n", "<leader>a", function() 
    grapple.tag()
end)

vim.keymap.set("n", "<c-e>", function()
    grapple.toggle_tags()
end)

for i=1,9,1 do
    vim.keymap.set("n", "<c-" .. tostring(i%9) .. ">", function()
        grapple.select({index=i})
    end)
end
