local _M = {}

_M.colors = {
    bg = "#2e3440",
    fg = "#ECEFF4",
    red = "#bf616a",
    orange = "#d08770",
    yellow = "#ebcb8b",
    blue = "#5e81ac",
    green = "#a3be8c",
    cyan = "#88c0d0",
    magenta = "#b48ead",

    bg0 = "#949fb5",
    bg1 = "#4C566A",
    bg2 = "#434C5E",
    bg3 = "#3B4252",
    bg4 = "#242932",
    bg5 = "#1e222a",
    bg6 = "#1c1f26",
}

_M.init = function()
    local _onenord, onenord = pcall(require, "onenord")

    if not _onenord then
        return
    end

    onenord.setup {
        borders = true,
        fade_nc = false,
        styles = {
            comments = "italic",
            strings = "NONE",
            keywords = "NONE",
            functions = "italic",
            variables = "bold",
            diagnostics = "underline",
        },
        disable = {
            background = false,
            cursorline = false,
            eob_lines = true,
        },
        custom_highlights = {
            VertSplit = { fg = _M.colors.bg5 },
            BufferLineIndicatorSelected = { fg = _M.colors.cyan, bg = _M.colors.bg },
            BufferLineFill = { fg = _M.colors.fg, bg = _M.colors.bg4 },
            NvimTreeNormal = { fg = _M.colors.fg, bg = _M.colors.bg4 },
            NvimTreeVertSplit = { fg = _M.colors.bg, bg = _M.colors.bg },
            WhichKeyFloat = { bg = _M.colors.bg4 },
            GitSignsAdd = { fg = _M.colors.green },
            GitSignsChange = { fg = _M.colors.orange },
            GitSignsDelete = { fg = _M.colors.red },
            NvimTreeFolderIcon = { fg = _M.colors.bg0 },
            NvimTreeIndentMarker = { fg = _M.colors.bg1 },
            NvimTreeOpenedFolderName = { fg = _M.colors.yellow },
            NvimTreeRootFolder = { fg = _M.colors.bg0 },

            NormalFloat = { bg = _M.colors.bg4 },
            FloatBorder = { bg = _M.colors.bg4, fg = _M.colors.bg4 },

            TelescopeSelection = { bg = _M.colors.bg4, style = "bold" },

            TelescopePromptPrefix = { bg = _M.colors.bg4 },
            TelescopePromptNormal = { bg = _M.colors.bg4 },
            TelescopeResultsNormal = { bg = _M.colors.bg5 },
            TelescopePreviewNormal = { bg = _M.colors.bg6 },

            TelescopePromptBorder = { bg = _M.colors.bg4, fg = _M.colors.bg4 },
            TelescopeResultsBorder = { bg = _M.colors.bg5, fg = _M.colors.bg5 },
            TelescopePreviewBorder = { bg = _M.colors.bg6, fg = _M.colors.bg6 },

            TelescopePromptTitle = { fg = _M.colors.bg4, bg = _M.colors.bg4 },
            TelescopeResultsTitle = { fg = _M.colors.bg5, bg = _M.colors.bg5 },
            TelescopePreviewTitle = { fg = _M.colors.bg6, bg = _M.colors.bg6 },

            Pmenu = { bg = _M.colors.bg4 },
            PMenuThumb = { bg = _M.colors.bg6 },

            LspFloatWinNormal = { fg = _M.colors.fg, bg = _M.colors.bg4 },
            LspFloatWinBorder = { fg = _M.colors.bg4 },

            IndentBlanklineChar = { fg = _M.colors.bg3, style = "nocombine" },
            IndentBlanklineContextChar = { fg = _M.colors.bg1, style = "nocombine" },
            Folded = { link = "Comment" },

            TSVariable = { fg = _M.colors.blue },
        },
    }
end

return _M
