local theme = {}

function theme.get_colors()
	local THEME_NAME = "carbon"
	local palettes = require("theme.palettes." .. THEME_NAME)

	return palettes.mocha
end

function theme.setup(config)
	local colors = theme.get_colors()

	config.colors = {
		split = colors.base,
		foreground = colors.text,
		background = colors.base,
		cursor_bg = colors.overlay0,
		cursor_border = colors.overlay0,
		cursor_fg = colors.base,
		selection_bg = colors.surface2,
		selection_fg = colors.text,
		visual_bell = colors.surface0,
		indexed = {
			[16] = colors.peach,
			[17] = colors.rosewater,
		},
		scrollbar_thumb = colors.surface2,
		compose_cursor = colors.flamingo,
		ansi = {
			colors.surface0,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.mauve,
			colors.teal,
			colors.text,
		},
		brights = {
			colors.surface2,
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.mauve,
			colors.teal,
			colors.surface2,
		},
		tab_bar = {
			background = colors.mantle,
			active_tab = {
				bg_color = "none",
				fg_color = colors.subtext1,
				intensity = "Bold",
				italic = true,
			},
			inactive_tab = {
				bg_color = colors.mantle,
				fg_color = colors.surface2,
			},
			inactive_tab_hover = {
				bg_color = colors.mantle,
				fg_color = colors.surface2,
			},
			new_tab = {
				bg_color = colors.mantle,
				fg_color = colors.subtext0,
			},
			new_tab_hover = {
				bg_color = colors.mantle,
				fg_color = colors.surface2,
			},
		},
	}
end

return theme
