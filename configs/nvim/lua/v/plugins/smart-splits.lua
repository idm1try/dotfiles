return {
  "mrjones2014/smart-splits.nvim",
  keys = {
    {
      "<A-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
      desc = "navigator left",
    },
    {
      "<A-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
      desc = "navigator right",
    },
    {
      "<A-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
      desc = "navigator up",
    },
    {
      "<A-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
      desc = "navigator down",
    },
    {
      "<A-H>",
      function()
        require("smart-splits").resize_left()
      end,
      desc = "resize left",
    },
    {
      "<A-L>",
      function()
        require("smart-splits").resize_right()
      end,
      desc = "resize right",
    },
    {
      "<A-K>",
      function()
        require("smart-splits").resize_up()
      end,
      desc = "resize up",
    },
    {
      "<A-J>",
      function()
        require("smart-splits").resize_down()
      end,
      desc = "resize down",
    },
  },
  config = true,
}
