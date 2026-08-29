require 'typst-preview'.setup {
    debug = false,

    -- Custom format string to open the output link provided with %s
    -- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
    open_cmd = 'zen --new-window %s',

    -- Setting this to 'always' will invert black and white in the preview
    -- Setting this to 'auto' will invert depending if the browser has enable
    -- dark mode
    invert_colors = '{"rest": "always","image": "never"}',

    -- Whether the preview will follow the cursor in the source file
    follow_cursor = true,

    -- Provide the path to binaries for dependencies.
    -- Setting this will skip the download of the binary by the plugin.
    -- Warning: Be aware that your version might be older than the one
    -- required.
    dependencies_bin = {
        tinymist = vim.fn.exepath('tinymist'),
        websocat = vim.fn.exepath('websocat')
    },

    -- This function will be called to determine the root of the typst project
    get_root = function(path_of_main_file)
        local root = os.getenv 'TYPST_ROOT'
        if root then
            return root
        end
        return vim.fn.fnamemodify(path_of_main_file, ':p:h')
    end,

    -- This function will be called to determine the main file of the typst
    -- project.
    get_main_file = function(path_of_buffer)
        return path_of_buffer
    end,
}

vim.api.nvim_create_user_command('TypstPreviewLightMode', function()
    local typst_preview = require("typst-preview")

    -- Get existing config and override just the invert_colors setting
    local config = require("typst-preview.config")
    local new_config = vim.tbl_deep_extend("force", config, {
        invert_colors = 'never'
    })

    typst_preview.setup(new_config)

    vim.cmd("TypstPreview")

    typst_preview.setup(config)
end, {})
