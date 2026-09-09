vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
        return
    end

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
    -- Tinymist-specific mappings
    if client and client.name == "tinymist" then

      -- Normal mode preview
      vim.keymap.set("n", "<leader>tt", ":TypstPreview<CR>")
      -- Slide mode preview
      vim.keymap.set("n", "<leader>ts", ":TypstPreview slide<CR>")
      -- Sync cursor
      vim.keymap.set("n", "<leader>tc", ":TypstPreviewSyncCursor<CR>")

      vim.keymap.set("n", "<leader>tp", function()
        client:exec_cmd({
          title = "Pin main Typst file",
          command = "tinymist.pinMain",
          arguments = {
            vim.api.nvim_buf_get_name(bufnr),
          },
        }, {
          bufnr = bufnr,
        })
      end, {
        buffer = bufnr,
        desc = "[T]inymist [P]in",
        noremap = true,
      })

      vim.keymap.set("n", "<leader>tu", function()
        client:exec_cmd({
          title = "Unpin main Typst file",
          command = "tinymist.pinMain",
          arguments = {
            vim.v.null,
          },
        }, {
          bufnr = bufnr,
        })
      end, {
        buffer = bufnr,
        desc = "[T]inymist [U]npin",
        noremap = true,
      })
    end
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
    settings = {
        formatterMode = "typstyle",
        formatterProseWrap = true,
        formatterPrintWidth = 80,
        formatterIndentSize = 2,
    },
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
    filetypes = { "java" },
    root_markers = { "mvnw", "gradlew", "settings.gradle", "settings.gradle.kts", ".git", "build.xml", "pom.xml", "build.gradle", "build.gradle.kts" },
})

vim.lsp.enable("rust_analyzer")
vim.lsp.config("rust_analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.lock" },
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        },
    },
})
