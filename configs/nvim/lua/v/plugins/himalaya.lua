return {
  "https://git.sr.ht/~soywod/himalaya-vim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = true,
  keys = {
    {
      "<leader>h",
      "<cmd>Himalaya<cr>",
      desc = "[himalaya]",
    },
  },
}
