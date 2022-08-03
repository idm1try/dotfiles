local dressing = require "dressing"

dressing.setup {
    input = {
        winblend = 0,
        insert_only = false,
    },
    select = {
        backend = { "telescope" },
        telescope = require("telescope.themes").get_dropdown {
            layout_strategy = "horizontal",
            border = {},
            borderchars = { "" },
        },
    },
}
