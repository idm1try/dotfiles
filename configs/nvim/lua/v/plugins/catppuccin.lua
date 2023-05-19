return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 100,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
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
      custom_highlights = function(colors)
        return {
          NormalFloat = { bg = colors.mantle },
          FloatBorder = { bg = colors.mantle, fg = colors.mantle },
          CursorLineNr = { fg = colors.mauve, style = { "bold" } },
          PmenuSel = { bg = colors.surface0, fg = "" },
          Pmenu = { bg = colors.mantle },
          PmenuSbar = { bg = colors.crust },
          PmenuThumb = { bg = colors.surface0 },
          VertSplit = { fg = colors.none },

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

          TroubleNormal = { bg = colors.none },
          NvimTreeNormal = { bg = colors.none },
          NvimTreeIndentMarker = { fg = colors.surface0 },

          NoiceConfirm = { bg = colors.mantle, fg = colors.mauve },
          NoiceCmdlineIconLua = { fg = colors.blue },
          NoiceConfirmBorder = { bg = colors.mantle, fg = colors.mantle },
          NoiceMini = { link = "Comment" },
          NoiceLspProgressClient = { fg = colors.blue, style = { "italic", "bold" } },
        }
      end,
    })

    vim.api.nvim_command("colorscheme catppuccin")
  end,
}
