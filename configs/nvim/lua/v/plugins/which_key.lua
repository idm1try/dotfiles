return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.register({
      ["<leader>f"] = { name = "+telescope" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>l"] = { name = "+lsp" },
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
        ["<space>"] = "space",
        ["<leader>"] = "space",
        ["<cr>"] = "return",
        ["<tab>"] = "tab",
      },
    })
  end,
}
