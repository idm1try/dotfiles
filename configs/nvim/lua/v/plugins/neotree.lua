return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>n",
      "<CMD>NeoTreeFloatToggle<CR>",
      desc = "[tree] float",
    },
  },
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
    sort_case_insensitive = false,
    default_component_configs = {
      container = {
        enable_character_fade = true,
      },
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "IndentBlanklineChar",
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "IndentBlanklineContextChar",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
      },
      modified = {
        symbol = "●",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          added = "+",
          modified = "~",
          deleted = "",
          renamed = "",
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
      },
    },
    commands = {},
    window = {
      position = "left",
      width = 34,
      mappings = {
        ["o"] = "open",
        ["<c-x>"] = "open_split",
        ["<c-v>"] = "open_vsplit",
      },
    },
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = true,
      use_libuv_file_watcher = true,
      components = {
        name = function(config, node, state)
          local cc = require("neo-tree.sources.common.components")
          local result = cc.name(config, node, state)
          if node:get_depth() == 1 then
            result.text = string.gsub(state.path, "(.*[/\\])(.*)", "%2")
          end
          return result
        end,
      },
    },
    event_handlers = {

      {
        event = "file_opened",
        handler = function()
          require("neo-tree").close_all()
        end,
      },
    },
  },
}
