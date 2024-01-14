return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local MAX_FILE_LINES = 5000
    local MAX_FILE_SIZE = 1048576 -- 1MB

    require("nvim-treesitter.configs").setup({
      autotag = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      auto_install = false,
      sync_install = true,
      ignore_install = {},
      modules = {},
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "cmake",
        "comment",
        "diff",
        "fennel",
        "fish",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "gpg",
        "html",
        "http",
        "ini",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "nix",
        "regex",
        "rust",
        "scss",
        "css",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vimdoc",
        "vim",
        "yaml",
        "zig",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        max_file_lines = MAX_FILE_LINES,
        disable = function(_, bufnr)
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
          if ok and stats and stats.size > MAX_FILE_SIZE then
            return true
          end
        end,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<c-backspace>",
        },
      },
    })
    require("ts_context_commentstring").setup({
      enable_autocmd = false,
    })
  end,
}
