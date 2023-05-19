return {
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = {
          format = {
            { "{data.progress.title} ", hl_group = "Comment" },
            { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
          },
          format_done = {
            { "{data.progress.title} ", hl_group = "Comment" },
            { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
          },
        },
      },
      cmdline = {
        enabled = true,
        view = "cmdline",
        format = {
          cmdline = { pattern = "^:", icon = " ", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = "  ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = "  ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = " $", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = " ", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = " " },
          input = {},
        },
      },
      presets = {
        lsp_doc_border = true,
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
