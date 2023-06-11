local select = require("select")
local follow = require("follow")
local settings = require("settings")
local modes = require("modes")
require("lousy.widget.tablist")

select.label_maker = function(s)
	return s.sort(s.reverse(s.charset("etovxqpdygfblzhckisuran")))
end
follow.pattern_maker = follow.pattern_styles.match_label

settings.window.search_engines = {
	searxng = "https://xo.wtf/search?q=%s",
	ddg = "https://duckduckgo.com/?q=%s",
	whg = "https://whoogle.ftw.lol/search?q=%s",
	github = "https://github.com/search?q=%s",
	wiki = "https://en.wikipedia.org/wiki/Special:Search?search=%s",
	invidious = "https://invidious.snopyta.org/search?q=%s",
	reddit = "https://reddi.tk/search?q=%s",
	nix = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=%s",
	osm = "https://www.openstreetmap.org/search?query=%s",
}

settings.window.default_search_engine = "searxng"
settings.webview.enable_webaudio = true
settings.window.home_page = "luakit://newtab/"
settings.webview.monospace_font_family = "CartographCF Nerd Font"
settings.webview.pictograph_font_family = "CartographCF Nerd Font"
settings.webview.serif_font_family = "CartographCF Nerd Font"
settings.webview.sans_serif_font_family = "CartographCF Nerd Font"
settings.tablist.visibility = "never"

modes.add_binds("normal", {
	{
		"<Control-c>",
		"Copy selected text.",
		function()
			luakit.selection.clipboard = luakit.selection.primary
		end,
	},
})
