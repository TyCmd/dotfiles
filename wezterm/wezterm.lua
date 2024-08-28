-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- A GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/

local wezterm = require("wezterm")
local act = wezterm.action

local fish_path = "/opt/homebrew/bin/fish"

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.enable_tab_bar = false
-- config.color_scheme = "Night Owl (Gogh)"
-- config.color_scheme = "carbonfox"
config.color_scheme = "tokyonight_night"
-- config.color_schemes = {
-- 	["dracula"] = {
-- 		foreground = "#F8F8F2",
-- 		background = "#22212C",
-- 		cursor_bg = "#FF80BF",
-- 		cursor_border = "#FF80BF",
-- 		cursor_fg = "#22212C",
-- 		selection_bg = "#454158",
-- 		selection_fg = "#F8F8F2",
--
-- 		ansi = {
-- 			"#22212C",
-- 			"#FF9580",
-- 			"#8AFF80",
-- 			"#FFFF80",
-- 			"#9580FF",
-- 			"#FF80BF",
-- 			"#80FFEA",
-- 			"#F8F8F2",
-- 		},
--
-- 		brights = {
-- 			"#7970A9",
-- 			"#FF9580",
-- 			"#8AFF80",
-- 			"#FFFF80",
-- 			"#9580FF",
-- 			"#FF80BF",
-- 			"#80FFEA",
-- 			"#FFFFFF",
-- 		},
-- 	},
-- }
-- config.color_scheme = "dracula"

-- Fonts
config.font_size = 15
config.font = wezterm.font({
	family = "Cascadia Code",
	weight = 350,
	harfbuzz_features = { "calt", "ss19" },
})
-- config.font = wezterm.font({ family = "Comic Code Ligatures" })
-- config.font = wezterm.font({ family = "MonoLisa Variable", harfbuzz_features = { "ss03", "ss07", "ss13" } })
-- config.font = wezterm.font({ family = "MonoLisa Variable" })
-- config.font = wezterm.font({ family = "Hack" })
-- config.font = wezterm.font({ family = "Jetbrains Mono" })
-- config.bold_brightens_ansi_colors = true
-- config.font = wezterm.font({ family = "FiraCode Nerd Font", weight = 450 })
-- config.font_rules = {
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font({ family = "Maple Mono NF", weight = "Bold", style = "Italic" }),
-- 	},
-- 	{
-- 		italic = true,
-- 		intensity = "Half",
-- 		font = wezterm.font({ family = "Maple Mono NF", weight = "DemiBold", style = "Italic" }),
-- 	},
-- 	{
-- 		italic = true,
-- 		intensity = "Normal",
-- 		font = wezterm.font({ family = "Maple Mono NF", style = "Italic" }),
-- 	},
-- }
-- Wallpaper settings
-- config.window_background_image = "/Users/tyler/Pictures/Wallpapers/dark_boat.png"
-- config.window_background_image_hsb = {
-- 	-- hue = 0.5,
-- 	-- saturation = 0.5,
-- 	brightness = 0.3,
-- }
--
-- Window background
config.window_background_opacity = 0.7
config.macos_window_background_blur = 35

config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"

-- Cursor
config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
-- window_background_opacity = 0.9,
-- cell_width = 0.9,
config.scrollback_lines = 10000

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}

-- Tab bar
-- I don't like the look of "fancy" tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false
wezterm.on("update-status", function(window, pane)
	-- Workspace name
	local stat = window:active_workspace()
	local stat_color = "#f7768e"
	-- It's a little silly to have workspace name all the time
	-- Utilize this to display LDR or current key table name
	if window:active_key_table() then
		stat = window:active_key_table()
		stat_color = "#7dcfff"
	end
	if window:leader_is_active() then
		stat = "LDR"
		stat_color = "#bb9af7"
	end

	-- Current working directory
	local basename = function(s)
		-- Nothing a little regex can't fix
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end
	-- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l). Not a big deal, but check in case
	local cwd = pane:get_current_working_dir()
	cwd = cwd and basename(cwd) or ""
	-- Current command
	local cmd = pane:get_foreground_process_name()
	cmd = cmd and basename(cmd) or ""

	-- Time
	local time = wezterm.strftime("%H:%M")

	-- Left status (left of the tab line)
	window:set_left_status(wezterm.format({
		{ Foreground = { Color = stat_color } },
		{ Text = "  " },
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
		{ Text = " |" },
	}))

	-- Right status
	window:set_right_status(wezterm.format({
		-- Wezterm has a built-in nerd fonts
		-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "#e0af68" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = "  " },
	}))
end)

--[[ Appearance setting for when I need to take pretty screenshots
config.enable_tab_bar = false
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = '0cell',

}
--]]
config.webgpu_power_preference = "HighPerformance"
return config
