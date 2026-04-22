local lsp_zero = require("lsp-zero")

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
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
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.select }

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
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

-- formatter setup. Ensure all formatters are installed by Mason
require("conform").setup({
	formatters_by_ft = {
		python = { "autopep8", "isort" },
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

vim.lsp.enable("nuls")
vim.lsp.config("nuls", {
    cmd = { "nu", "--lsp" },
    filetypes = { "nu" },
})

vim.lsp.enable("jdtls")
vim.lsp.config("jdtls", {
    cmd = { "jdtls" },
    filetypes = { "java" };
    root_mrakers = { "build.xml", ".git" },
})
