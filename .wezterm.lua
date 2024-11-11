-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Material Darker (base16)"
	else
		return "Material"
	end
end

config.color_scheme = scheme_for_appearance(get_appearance())
config.font = wezterm.font("Monaspace Neon")
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "AlwaysPrompt"
config.window_decorations = "RESIZE" -- disable the title bar but enable the resizable border
config.audible_bell = "Disabled"

-- and finally, return the configuration to wezterm
return config
