-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
  end,
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
})

require("conform").setup({
	formatters_by_ft = {
		haskell = { "fourmolu" },
        nix = { "nixfmt" },
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})

vim.lsp.enable("nil")
vim.lsp.config("nil", {
    cmd = { "nil" },
    filetypes = { "nix" },
    root_markers = { "flake.nix", ".git" },
})

vim.lsp.enable("tinymist")
vim.lsp.config("tinymist", {
    cmd = { "tinymist" },
    filetypes = { "typst" },
    root_markers = { "main.typ", ".git" },
})

vim.lsp.enable("nuls")
vim.lsp.config("nuls", {
    cmd = { "nu", "--lsp" },
    filetypes = { "nu" },
})

vim.lsp.enable("jdtls")
vim.lsp.config("jdtls", {
    cmd = { "jdtls" },
    filetypes = { "java" },
    root_markers = { "mvnw", "gradlew", "settings.gradle", "settings.gradle.kts", ".git", "build.xml", "pom.xml", "build.gradle", "build.gradle.kts" },
})
