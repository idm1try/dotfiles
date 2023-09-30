local theme = {}

theme.colors = {
	rosewater = "#da1e28",
	flamingo = "#da1e28",
	red = "#da1e28",
	maroon = "#da1e28",
	pink = "#d02670",
	mauve = "#8a3ffc",
	peach = "#d44a1c",
	yellow = "#ab8600",
	green = "#007d79",
	teal = "#1192e8",
	sky = "#1192e8",
	sapphire = "#1192e8",
	blue = "#0f62fe",
	lavender = "#0f62fe",
	text = "#000000",
	subtext1 = "#404040",
	subtext0 = "#474747",
	overlay2 = "#575757",
	overlay1 = "#595959",
	overlay0 = "#737373",
	surface2 = "#8c8c8c",
	surface1 = "#d1d1d1",
	surface0 = "#e6e6e6",
	base = "#FFFFFF",
	mantle = "#f2f2f2",
	crust = "#ebebeb",
}

function theme.setup(config)
	local colors = theme.colors

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
