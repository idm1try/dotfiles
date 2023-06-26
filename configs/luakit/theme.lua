local theme = {}

local colors = {
	rosewater = "#ff8389",
	flamingo = "#ff8389",
	red = "#ff8389",
	maroon = "#ff8389",
	pink = "#ff7eb6",
	mauve = "#be95ff",
	peach = "#d44a1c",
	yellow = "#ab8600",
	green = "#08bdba",
	teal = "#33b1ff",
	sky = "#33b1ff",
	sapphire = "#33b1ff",
	blue = "#78a9ff",
	lavender = "#78a9ff",
	text = "#ffffff",
	subtext1 = "#f4f4f4",
	subtext0 = "#e0e0e0",
	overlay2 = "#adadad",
	overlay1 = "#949494",
	overlay0 = "#7a7a7a",
	surface2 = "#4f4f4f",
	surface1 = "#383838",
	surface0 = "#2e2e2e",
	base = "#161616",
	mantle = "#0d0d0d",
	crust = "#000000",
}

theme.font = "15px CartographCF Nerd Font"
theme.fg = colors.text
theme.bg = colors.base

theme.success_fg = colors.blue
theme.loaded_fg = colors.blue
theme.error_fg = colors.red
theme.error_bg = "#32283A"

theme.warning_fg = colors.yellow
theme.warning_bg = "#33313A"

theme.notif_fg = colors.overlay0
theme.notif_bg = colors.mantle

theme.menu_fg = colors.text
theme.menu_bg = colors.mantle
theme.menu_selected_fg = colors.text
theme.menu_selected_bg = colors.surface0
theme.menu_title_bg = colors.mantle
theme.menu_primary_title_fg = colors.mauve
theme.menu_secondary_title_fg = colors.mauve

theme.menu_disabled_fg = colors.overlay0
theme.menu_disabled_bg = colors.mantle
theme.menu_enabled_fg = colors.text
theme.menu_enabled_bg = colors.mantle
theme.menu_active_fg = colors.text
theme.menu_active_bg = colors.mantle

theme.proxy_active_menu_fg = colors.text
theme.proxy_active_menu_bg = colors.mantle
theme.proxy_inactive_menu_fg = colors.overlay0
theme.proxy_inactive_menu_bg = colors.mantle

theme.sbar_fg = colors.text
theme.sbar_bg = colors.mantle

theme.dbar_fg = colors.text
theme.dbar_bg = colors.base
theme.dbar_error_fg = colors.red

theme.ibar_fg = colors.text
theme.ibar_bg = colors.mantle

theme.tab_fg = colors.overlay0
theme.tab_bg = colors.mantle
theme.tab_hover_bg = colors.mantle
theme.tab_ntheme = colors.text
theme.selected_fg = colors.text
theme.selected_bg = colors.base
theme.selected_ntheme = colors.text
theme.loading_fg = colors.blue
theme.loading_bg = colors.mantle

theme.selected_private_tab_bg = colors.mauve
theme.private_tab_bg = colors.mantle

theme.trust_fg = colors.blue
theme.notrust_fg = colors.red

theme.hint_font = "15px CartographCF Nerd Font"
theme.hint_fg = colors.mauve
theme.hint_bg = colors.mantle
theme.hint_border = "1px solid " .. colors.crust
theme.hint_opacity = "0.3"
theme.hint_overlay_bg = colors.mantle
theme.hint_overlay_border = "1px solid " .. colors.crust
theme.hint_overlay_selected_bg = colors.mauve
theme.hint_overlay_selected_border = theme.hint_overlay_border

theme.ok = { fg = colors.text, bg = colors.base }
theme.warn = { fg = colors.yellow, bg = colors.base }
theme.error = { fg = colors.red, bg = colors.base }

theme.gopher_light = { bg = colors.base, fg = colors.text, link = colors.mauve }
theme.gopher_dark = { bg = colors.base, fg = colors.text, link = colors.mauve }

return theme
