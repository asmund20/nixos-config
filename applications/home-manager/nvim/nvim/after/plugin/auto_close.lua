require("autoclose").setup({
	keys = {
		["("] = { escape = false, close = true, pair = "()" },
		["["] = { escape = false, close = true, pair = "[]" },
		["{"] = { escape = false, close = true, pair = "{}" },

		[">"] = { escape = true, close = false, pair = "<>" },
		[")"] = { escape = true, close = false, pair = "()" },
		["]"] = { escape = true, close = false, pair = "[]" },
		["}"] = { escape = true, close = false, pair = "{}" },

		['"'] = { escape = true, close = true, pair = '""' },
		["'"] = { escape = true, close = true, pair = "''", disabled_filetypes = { "haskell", "typst", "markdown" } },

		["$"] = { escape = true, close = true, pair = "$$", enabled_filetypes = { "typst", "markdown" } },
	},
	options = {
		disabled_filetypes = { "text" },
		disable_when_touch = true,
		touch_regex = "[%w(%[{]",
		pair_spaces = false,
		auto_indent = true,
		disable_command_mode = false,
	},
})
