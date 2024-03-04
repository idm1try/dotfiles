local theme = require("theme")
local keys = require("keys")
local tab = require("tab")
local fonts = require("fonts")

local config = {
	term = "wezterm",
	set_environment_variables = {
		TERMINFO_DIRS = "/etc/profiles/per-user/idm1try/share/terminfo",
	},
	window_padding = {
		left = 30,
		right = 30,
		top = 30,
		bottom = 30,
	},
	use_resize_increments = true,
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 1.0,
	},
	initial_rows = 30,
	initial_cols = 170,
	warn_about_missing_glyphs = false,
	show_update_window = false,
	check_for_updates = false,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	hide_mouse_cursor_when_typing = false,
	audible_bell = "Disabled",
	enable_scroll_bar = false,
	front_end = "OpenGL",
	mouse_wheel_scrolls_tabs = false,
	pane_focus_follows_mouse = true,
	hyperlink_rules = {
		{
			regex = "\\((\\w+://\\S+)\\)",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "\\[(\\w+://\\S+)\\]",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "\\{(\\w+://\\S+)\\}",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "<(\\w+://\\S+)>",
			format = "$1",
			highlight = 1,
		},
		{
			regex = "\\b\\w+://\\S+[)/a-zA-Z0-9-]+",
			format = "$0",
		},
		{
			regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
			format = "mailto:$0",
		},
		{
			regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
			format = "https://www.github.com/$1/$3",
		},
	},
}

tab.setup(config)
keys.setup(config)
fonts.setup(config)
theme.setup(config)

return config
