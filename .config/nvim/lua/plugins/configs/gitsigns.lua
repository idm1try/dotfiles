local gitsigns = require "gitsigns"

gitsigns.setup {
    signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAdd", linehl = "GitSignsAdd" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChange", linehl = "GitSignsChange" },
        delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDelete", linehl = "GitSignsDelete" },
        topdelete = {
            hl = "GitSignsDelete",
            text = "‾",
            numhl = "GitSignsDelete",
            linehl = "GitSignsDelete",
        },
        changedelete = {
            hl = "GitSignsChange",
            text = "~",
            numhl = "GitSignsChange",
            linehl = "GitSignsChange",
        },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    keymaps = {},
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
    },
    current_line_blame_formatter_opts = {
        relative_time = false,
    },
    sign_priority = 6,
    update_debounce = 150,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
    yadm = {
        enable = false,
    },
}
