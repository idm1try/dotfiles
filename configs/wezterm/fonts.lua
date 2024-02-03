local wezterm = require("wezterm")

local fonts = {}

function fonts.setup(config)
	config.font = wezterm.font_with_fallback({ "CartographCF Nerd Font" })
	config.font_size = 12
	config.underline_thickness = "200%"
	config.underline_position = "-4pt"
	config.line_height = 1.6
	config.font_rules = {
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
	}
end

return fonts
