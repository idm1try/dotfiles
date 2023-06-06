local wezterm = require("wezterm")
local Theme = require("theme")
local Keys = require("keys")
local Tab = require("tab")

Tab.setup()

return {
	term = "wezterm",
	set_environment_variables = {
		TERMINFO_DIRS = "/etc/profiles/per-user/idm1try/share/terminfo",
	},
	font = wezterm.font_with_fallback({ "CartographCF Nerd Font" }),
	font_rules = {
		{
			italic = false,
			intensity = "Bold",
			font = wezterm.font_with_fallback({
				{ family = "CartographCF Nerd Font", weight = "Black" },
			}),
		},
		{
			italic = true,
			intensity = "Bold",
			font = wezterm.font_with_fallback({
				{ family = "CartographCF Nerd Font", weight = "Black", style = "Italic" },
			}),
		},
		{
			italic = false,
			intensity = "Half",
			font = wezterm.font_with_fallback({
				{ family = "CartographCF Nerd Font", weight = "Light" },
			}),
		},
		{
			italic = true,
			intensity = "Half",
			font = wezterm.font_with_fallback({
				{ family = "CartographCF Nerd Font", weight = "Light", style = "Italic" },
			}),
		},
	},
	underline_thickness = "200%",
	underline_position = "-4pt",
	font_size = 12,
	initial_rows = 30,
	initial_cols = 170,
	warn_about_missing_glyphs = false,
	show_update_window = false,
	check_for_updates = false,
	line_height = 1.4,
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	hide_mouse_cursor_when_typing = false,
	audible_bell = "Disabled",
	window_padding = {
		left = 30,
		right = 30,
		top = 30,
		bottom = 30,
	},
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 1.0,
	},
	enable_scroll_bar = false,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	tab_max_width = 50,
	hide_tab_bar_if_only_one_tab = true,
	front_end = "OpenGL",
	disable_default_key_bindings = true,
	mouse_wheel_scrolls_tabs = false,
	pane_focus_follows_mouse = true,
	colors = Theme.colors,
	keys = Keys,
	hyperlink_rules = {
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
