local select = require("select")
local webview = require("webview")
local window = require("window")
local follow = require("follow")
local settings = require("settings")
local modes = require("modes")

select.label_maker = function(s)
	return s.sort(s.reverse(s.charset("etovxqpdygfblzhckisuran")))
end
follow.pattern_maker = follow.pattern_styles.match_label

settings.window.default_search_engine = "duckduckgo"
settings.webview.enable_webaudio = true
settings.window.home_page = "luakit://newtab/"
settings.webview.monospace_font_family = "CartographCF Nerd Font"
settings.webview.pictograph_font_family = "CartographCF Nerd Font"
settings.webview.serif_font_family = "CartographCF Nerd Font"
settings.webview.sans_serif_font_family = "CartographCF Nerd Font"

webview.add_signal("init", function(view)
	view:add_signal("new-window-decision", function(v, uri, reason)
		local w = window.ancestor(v)
		w:new_tab(uri)
		return true
	end)
end)

modes.add_binds("normal", {
	{
		"<Control-c>",
		"Copy selected text.",
		function()
			luakit.selection.clipboard = luakit.selection.primary
		end,
	},
})
