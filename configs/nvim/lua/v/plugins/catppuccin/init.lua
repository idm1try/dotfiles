return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 100,
  config = function()
    local THEME_NAME = "carbon"

    local colors_overrides = THEME_NAME ~= "catppuccin" and require("v.plugins.catppuccin.themes." .. THEME_NAME) or {}
    require("catppuccin").setup({
      background = {
        light = "latte",
        dark = "mocha",
      },
      color_overrides = colors_overrides,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        functions = { "italic" },
        keywords = { "italic" },
        numbers = { "bold" },
        types = { "bold" },
      },
      integrations = {
        notify = true,
        lsp_trouble = true,
        dashboard = false,
        hop = true,
        nvimtree = false,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
      highlight_overrides = {
        all = function(colors)
          local base_overrides = {
            NormalFloat = { bg = colors.mantle },
            FloatBorder = { bg = colors.mantle, fg = colors.mantle },
            CursorLineNr = { fg = colors.mauve, style = { "bold" } },
            PmenuSel = { bg = colors.surface0, fg = "" },
            Pmenu = { bg = colors.mantle },
            PmenuSbar = { bg = colors.crust },
            PmenuThumb = { bg = colors.surface0 },
            VertSplit = { fg = colors.base },

            TelescopeSelection = { bg = colors.surface0 },
            TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },

            TelescopePromptPrefix = { bg = colors.surface0 },
            TelescopePromptNormal = { bg = colors.surface0 },
            TelescopeResultsNormal = { bg = colors.mantle },
            TelescopePreviewNormal = { bg = colors.crust },

            TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
            TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
            TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },

            TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
            TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
            TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },

            GitSignsChange = { fg = colors.peach },
            GitSignsCurrentLineBlame = { link = "Comment" },

            IndentBlanklineChar = { fg = colors.surface0 },
            IndentBlanklineContextChar = { fg = colors.surface2 },

            NoiceConfirm = { bg = colors.mantle, fg = colors.mauve },
            NoiceCmdlineIconLua = { fg = colors.blue },
            NoiceConfirmBorder = { bg = colors.mantle, fg = colors.mantle },
            NoiceMini = { link = "Comment" },
            NoiceLspProgressClient = { fg = colors.blue, style = { "italic", "bold" } },

            NeoTreeNormal = { bg = colors.mantle },
            NeoTreeRootName = { fg = colors.blue, style = { "bold" } },
            NeoTreeNormalNC = { bg = colors.mantle },
            NeoTreeFloatBorder = { link = "FloatBorder" },
            NeoTreeTabActive = { fg = colors.text, bg = colors.mantle },
            NeoTreeTabSeparatorActive = { fg = colors.mantle, bg = colors.mantle },
            NeoTreeTabInactive = { fg = colors.surface2, bg = colors.crust },
            NeoTreeTabSeparatorInactive = { fg = colors.crust, bg = colors.crust },
            NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
            NeoTreeGitConflict = { fg = colors.red },
            NeoTreeGitDeleted = { fg = colors.red },
            NeoTreeGitIgnored = { fg = colors.overlay0 },
            NeoTreeGitModified = { fg = colors.peach },
            NeoTreeGitUnstaged = { fg = colors.red },
            NeoTreeGitUntracked = { fg = colors.blue },
            NeoTreeGitStaged = { fg = colors.green },
          }

          local carbon_overrides = {
            Structure = { fg = colors.pink },
            StorageClass = { fg = colors.pink },
            Type = { fg = colors.pink, style = { "bold" } },
            Constant = { fg = colors.text, style = { "bold" } },
            Number = { fg = colors.text },
            Float = { fg = colors.text },
            Boolean = { fg = colors.pink },
            ["@function.builtin"] = { fg = colors.pink },
            ["@method"] = { fg = colors.pink },
            ["@constant"] = { fg = colors.text, style = { "bold" } },
            ["@variable.builtin"] = { fg = colors.pink },
            ["@type.builtin"] = { fg = colors.pink, style = { "bold" } },
          }

          return THEME_NAME == "carbon" and vim.tbl_extend("force", base_overrides, carbon_overrides) or base_overrides
        end,
      },
    })

    vim.api.nvim_command("colorscheme catppuccin")
  end,
}
