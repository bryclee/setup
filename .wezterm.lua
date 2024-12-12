-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"

local function get_dark_mode()
	if wezterm.gui then
		return wezterm.gui.get_appearance():find("Dark")
	end

	return true
end

local function scheme_for_appearance(darkTheme)
	if darkTheme then
		-- return "Material Darker (base16)"
		return "Rosé Pine (Gogh)"
	else
		return "Rosé Pine Dawn (Gogh)"
		-- return "Bluloco Zsh Light (Gogh)"
	end
end

-- local function border_for_appearance(darkTheme)
-- 	if darkTheme then
-- 		return "indigo"
-- 	else
-- 		return "purple"
-- 	end
-- end
--
local darkMode = get_dark_mode()
local colorScheme = scheme_for_appearance(darkMode)
-- local borderColor = border_for_appearance(darkMode)

config.color_scheme = colorScheme
config.font = wezterm.font("Monaspace Neon")
config.font_size = 12.0
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE" -- disable the title bar but enable the resizable border
-- config.window_frame = {
-- 	border_left_width = "0.3cell",
-- 	border_right_width = "0.3cell",
-- 	border_bottom_height = "0.20cell",
-- 	border_top_height = "0.20cell",
-- 	border_left_color = borderColor,
-- 	border_right_color = borderColor,
-- 	border_bottom_color = borderColor,
-- 	border_top_color = borderColor,
-- }
config.audible_bell = "Disabled"

config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- and finally, return the configuration to wezterm
return config
