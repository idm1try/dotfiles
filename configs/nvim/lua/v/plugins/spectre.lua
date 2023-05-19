return {
  "windwp/nvim-spectre",
  keys = {
    {
      "<leader>rr",
      function()
        require("spectre").open()
      end,
      desc = "[SPECTRE] Open Replace",
    },
  },
}
