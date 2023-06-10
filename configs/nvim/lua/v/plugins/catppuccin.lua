return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 100,
  config = function()
    require("catppuccin").setup({
      flavour = "latte",
      color_overrides = {
        latte = {
          rosewater = "#c14a4a",
          flamingo = "#c14a4a",
          pink = "#945e80",
          mauve = "#945e80",
          red = "#c14a4a",
          maroon = "#c14a4a",
          peach = "#c35e0a",
          yellow = "#a96b2c",
          green = "#6c782e",
          teal = "#4c7a5d",
          sky = "#4c7a5d",
          sapphire = "#4c7a5d",
          blue = "#45707a",
          lavender = "#45707a",
          text = "#654735",
          subtext1 = "#7b5d44",
          subtext0 = "#8f6f56",
          overlay2 = "#a28368",
          overlay1 = "#b6977a",
          overlay0 = "#c9aa8c",
          surface2 = "#A79C86",
          surface1 = "#C9C19F",
          surface0 = "#DFD6B1",
          base = "#fbf1c7",
          mantle = "#F3EAC1",
          crust = "#E7DEB7",
        },
      },
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
          return {
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
        end,
      },
    })

    vim.api.nvim_command("colorscheme catppuccin")
  end,
}
