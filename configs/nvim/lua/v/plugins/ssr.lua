return {
  "cshuaimin/ssr.nvim",
  keys = {
    {
      "<leader>rs",
      function()
        require("ssr").open()
      end,
      mode = { "n", "x" },
      desc = "Structural Replace",
    },
  },
}
