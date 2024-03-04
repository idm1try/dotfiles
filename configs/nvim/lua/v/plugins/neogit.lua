return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "sindrets/diffview.nvim",
  },
  cmd = "Neogit",
  keys = {
    {
      "<leader>gg",
      function()
        require("neogit").open()
      end,
      desc = "[git] neogit",
    },
  },
  opts = {
    disable_hint = true,
  },
}
