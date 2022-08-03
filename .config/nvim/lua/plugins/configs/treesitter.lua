local treesitter = require "nvim-treesitter.configs"
local colors = require("colorscheme").colors

treesitter.setup {
    autotag = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    ensure_installed = "all",
    ignore_install = { "phpdoc" },
    highlight = {
        enable = true,
    },
    rainbow = {
        colors = {
            colors.magenta,
            colors.cyan,
            colors.yellow,
            colors.orange,
            colors.red,
            colors.blue,
            colors.green,
        },
        enable = true,
        extended_mode = false,
        max_file_lines = nil,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["ap"] = "@parameter.outer",
                ["ip"] = "@parameter.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
