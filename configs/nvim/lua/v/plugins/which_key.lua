return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.register({
      ["<leader>f"] = { name = "+TELESCOPE" },
      ["<leader>g"] = { name = "+GIT" },
      ["<leader>l"] = { name = "+LSP" },
      ["<leader>t"] = { name = "+TROUBLE" },
      ["<leader>r"] = { name = "+REPLACE" },
    }, {
      mode = "n",
      prefix = "",
      silent = true,
      noremap = true,
      nowait = true,
    })

    wk.setup({
      icons = {
        breadcrumb = "",
        separator = "",
        group = " ",
      },
      key_labels = {
        ["<space>"] = "SPACE",
        ["<leader>"] = "SPACE",
        ["<cr>"] = "RETURN",
        ["<tab>"] = "TAB",
      },
    })
  end,
}
