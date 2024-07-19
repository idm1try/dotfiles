return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  tag = "v2.1.0",
  config = function()
    local wk = require("which-key")

    wk.register({
      ["<leader>f"] = { name = "+[telescope]" },
      ["<leader>g"] = { name = "+[git]" },
      ["<leader>l"] = { name = "+[lsp]" },
      ["<leader>t"] = { name = "+[typescript]" },
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
