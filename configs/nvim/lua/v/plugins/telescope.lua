return {
  "nvim-telescope/telescope.nvim",
  version = false,
  keys = {
    { "<leader>ff", "<CMD>Telescope find_files hidden=true<CR>", desc = "[TELESCOPE] Find File" },
    { "<leader><leader>", "<CMD>Telescope find_files hidden=true<CR>", desc = "[TELESCOPE] Find File" },
    {
      "<leader>fg",
      "<CMD>Telescope live_grep<CR>",
      desc = "[TELESCOPE] Find File by grep",
    },
    { "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "[TELESCOPE] Find buffers" },
    { "<leader>fd", "<CMD>Telescope diagnostics<CR>", desc = "[TELESCOPE] Diagnostics" },
    { "<leader>gf", "<CMD>Telescope git_status<CR>", desc = "[GIT] Files Status" },
    { "<leader>gc", "<CMD>Telescope git_commits<CR>", desc = "[GIT] Commits" },
    { "<leader>gb", "<CMD>Telescope git_branches<CR>", desc = "[GIT] Branches" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      picker = {
        hidden = false,
      },
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
        prompt_prefix = "     ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
          vertical = { mirror = false },
          width = 0.8,
          height = 0.8,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/", "target/" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "absolute" },
        winblend = 0,
        border = {},
        borderchars = { "" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          i = {
            ["<Tab>"] = "move_selection_next",
            ["<S-Tab>"] = "move_selection_previous",
          },
          n = {
            ["<Tab>"] = "move_selection_next",
            ["<S-Tab>"] = "move_selection_previous",
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")
  end,
}
