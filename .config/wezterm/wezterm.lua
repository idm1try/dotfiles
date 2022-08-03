local wt = require "wezterm"

local colors = {
    bg = "#2e3440",
    fg = "#ECEFF4",
    red = "#bf616a",
    orange = "#d08770",
    yellow = "#ebcb8b",
    blue = "#81A1C1",
    green = "#a3be8c",
    cyan = "#88c0d0",
    cyan0 = "#8FBCBB",
    magenta = "#b48ead",
    white = "#E5E9F0",

    bg0 = "#949fb5",
    bg1 = "#4C566A",
    bg2 = "#434C5E",
    bg3 = "#3B4252",
    bg4 = "#242932",
    bg5 = "#1e222a",
    bg6 = "#1c1f26",
}

return {
    font = wt.font_with_fallback {
        "Cascadia Code",
        "Liga SFMono Nerd Font",
    },
    font_size = 11.0,
    line_height = 1.6,
    window_decorations = "RESIZE",
    -- use_resize_increments = true,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    enable_scroll_bar = false,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    tab_max_width = 24,
    scrollback_lines = 5000,
    enable_wayland = false,
    front_end = "OpenGL",
    adjust_window_size_when_changing_font_size = false,
    enable_kitty_graphics = true,
    cursor_blink_rate = 0,
    audible_bell = "Disabled",
    inactive_pane_hsb = {
        saturation = 1.0,
        brightness = 1.0,
    },
    disable_default_key_bindings = true,
    keys = {
        {
            mods = "ALT",
            key = [[\]],
            action = wt.action {
                SplitHorizontal = { domain = "CurrentPaneDomain" },
            },
        },
        {
            mods = "ALT",
            key = [[-]],
            action = wt.action {
                SplitVertical = { domain = "CurrentPaneDomain" },
            },
        },
        {
            key = "n",
            mods = "ALT",
            action = wt.action { SpawnTab = "CurrentPaneDomain" },
        },
        {
            key = "Q",
            mods = "ALT",
            action = wt.action { CloseCurrentTab = { confirm = false } },
        },
        { key = "q", mods = "ALT", action = wt.action.CloseCurrentPane { confirm = false } },
        { key = "z", mods = "ALT", action = wt.action.TogglePaneZoomState },

        { key = "H", mods = "CMD", action = wt.action.AdjustPaneSize { "Left", 1 } },
        { key = "J", mods = "CMD", action = wt.action.AdjustPaneSize { "Down", 1 } },
        { key = "K", mods = "CMD", action = wt.action.AdjustPaneSize { "Up", 1 } },
        { key = "L", mods = "CMD", action = wt.action.AdjustPaneSize { "Right", 1 } },

        { key = "h", mods = "CMD", action = wt.action { ActivatePaneDirection = "Left" } },
        { key = "j", mods = "CMD", action = wt.action { ActivatePaneDirection = "Down" } },
        { key = "k", mods = "CMD", action = wt.action { ActivatePaneDirection = "Up" } },
        { key = "l", mods = "CMD", action = wt.action { ActivatePaneDirection = "Right" } },

        { key = "1", mods = "CMD", action = wt.action { ActivateTab = 0 } },
        { key = "2", mods = "CMD", action = wt.action { ActivateTab = 1 } },
        { key = "3", mods = "CMD", action = wt.action { ActivateTab = 2 } },
        { key = "4", mods = "CMD", action = wt.action { ActivateTab = 3 } },
        { key = "5", mods = "CMD", action = wt.action { ActivateTab = 4 } },
        { key = "6", mods = "CMD", action = wt.action { ActivateTab = 5 } },
        { key = "7", mods = "CMD", action = wt.action { ActivateTab = 6 } },
        { key = "8", mods = "CMD", action = wt.action { ActivateTab = 7 } },
        { key = "9", mods = "CMD", action = wt.action { ActivateTab = 8 } },

        { key = "c", mods = "CMD", action = wt.action { CopyTo = "Clipboard" } },
        { key = "v", mods = "CMD", action = wt.action { PasteFrom = "Clipboard" } },

        { key = "=", mods = "CMD", action = wt.action.IncreaseFontSize },
        { key = "-", mods = "CMD", action = wt.action.DecreaseFontSize },
        { key = "0", mods = "CMD", action = wt.action.ResetFontSize },

        { key = "[", mods = "CMD", action = wt.action.ActivateCopyMode },

        { key = "m", mods = "CMD", action = wt.action.Hide },

        { key = "s", mods = "CMD", action = wt.action.Search { CaseInSensitiveString = "" } },

        { key = "q", mods = "CMD", action = wt.action.QuitApplication },
    },

    bold_brightens_ansi_colors = false,
    colors = {
        foreground = colors.fg,
        background = colors.bg,
        cursor_bg = colors.blue,
        cursor_border = colors.blue,
        cursor_fg = colors.bg,
        selection_bg = colors.yellow,
        selection_fg = colors.bg,
        split = colors.bg5,

        ansi = {
            colors.bg3,
            colors.red,
            colors.green,
            colors.yellow,
            colors.blue,
            colors.magenta,
            colors.cyan,
            colors.white,
        },
        brights = {
            colors.bg1,
            colors.red,
            colors.green,
            colors.yellow,
            colors.blue,
            colors.magenta,
            colors.cyan0,
            colors.fg,
        },
        tab_bar = {
            background = colors.bg3,
            active_tab = {
                bg_color = colors.cyan,
                fg_color = colors.bg,
                intensity = "Bold",
                italic = true,
            },
            inactive_tab = {
                bg_color = colors.bg3,
                fg_color = colors.bg0,
                intensity = "Bold",
            },
            new_tab = {
                bg_color = colors.bg3,
                fg_color = colors.bg3,
            },
        },
    },

    hyperlink_rules = {
        {
            regex = [[\b\w+://[\w.-]+\S*\b]],
            format = "$0",
        },
        {
            regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b",
            format = "$0",
        },
        {
            regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
            format = "mailto:$0",
        },
        {
            regex = [[\bfile://\S*\b]],
            format = "$0",
        },
        {
            regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
            format = "$0",
        },
        {
            regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
            format = "https://www.github.com/$1/$3",
        },
    },
}
