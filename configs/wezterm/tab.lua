local wezterm = require("wezterm")
local colors = require("theme").palette
local Tab = {}

local function get_process(tab)
	local process_icons = {
		["nvim"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = "" },
		},
		["vim"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = "" },
		},
		["node"] = {
			{ Foreground = { Color = colors.green } },
			{ Text = "󰋘" },
		},
		["zsh"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = "" },
		},
		["fish"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = "󰈺" },
		},
		["bash"] = {
			{ Foreground = { Color = colors.subtext0 } },
			{ Text = "" },
		},
		["htop"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = "󰞰" },
		},
		["cargo"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = "" },
		},
		["go"] = {
			{ Foreground = { Color = colors.sapphire } },
			{ Text = "" },
		},
		["git"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = "" },
		},
		["lazygit"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = "" },
		},
		["lua"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = "" },
		},
		["wget"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = "󰛀" },
		},
		["curl"] = {
			{ Foreground = { Color = colors.yellow } },
			{ Text = "" },
		},
		["gh"] = {
			{ Foreground = { Color = colors.mauve } },
			{ Text = "" },
		},
		["nix"] = {
			{ Foreground = { Color = colors.blue } },
			{ Text = "" },
		},
		["thokr"] = {
			{ Foreground = { Color = colors.peach } },
			{ Text = "󰌌" },
		},
	}

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

	if process_name == "" then
		process_name = "fish"
	end

	return wezterm.format(
		process_icons[process_name]
			or { { Foreground = { Color = colors.blue } }, { Text = string.format("[%s]", process_name) } }
	)
end

local function get_current_working_dir(tab)
	local cwd_uri = tab.active_pane.current_working_dir

	cwd_uri = cwd_uri:sub(8)

	local slash = cwd_uri:find("/")
	local cwd = cwd_uri:sub(slash)

	local HOME_DIR = os.getenv("HOME")
	if cwd == HOME_DIR then
		return "  ~"
	end

	return string.format("  %s", string.match(cwd, "[^/]+$"))
end

function Tab.setup()
	wezterm.on("format-tab-title", function(tab)
		return wezterm.format({
			{ Text = string.format("   ") },
			"ResetAttributes",
			{ Text = get_process(tab) },
			{ Text = " " },
			{ Text = get_current_working_dir(tab) },
			{ Foreground = { Color = colors.base } },
			{ Text = "  ▕" },
		})
	end)
end

return Tab
