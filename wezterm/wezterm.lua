local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.initial_cols = 120
config.initial_rows = 28

config.font_size = 18
config.color_scheme = "tokyonight"

config.background = {
	{
		source = {
			File = wezterm.config_dir .. "/wezbg.png",
		},
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		width = "Cover",
		height = "Cover",
		horizontal_align = "Center",
		hsb = {
			brightness = 0.05,
			hue = 1.0,
			saturation = 0.9,
		},
	},
}

config.keys = {
	{
		key = "v",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = wezterm.action({ ActivatePaneDirection = "Next" }),
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = wezterm.action({ ActivatePaneDirection = "Prev" }),
	},
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
