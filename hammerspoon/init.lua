-- To config - move the hammerspoon config to .config and create a symlink:
-- mv ~/.hammerspoon ~/.config/hammerspoon
-- ln -s ~/.config/hammerspoon ~/.hammerspoon

hs.hotkey.bind({ "ctrl" }, "]", function()
	local slack = hs.application.find("slack")
	if slack and slack:isFrontmost() then
		slack:hide()
	else
		hs.application.launchOrFocus("/Applications/Slack.app")
	end
end)

hs.hotkey.bind({ "ctrl" }, "[", function()
	local discord = hs.application.find("discord")
	if discord and discord:isFrontmost() then
		discord:hide()
	else
		hs.application.launchOrFocus("/Applications/Discord.app")
	end
end)

hs.hotkey.bind({ "ctrl" }, "b", function()
	local arc = hs.application.find("arc")
	if arc and arc:isFrontmost() then
		arc:selectMenuItem("Hide Arc")
	else
		hs.application.launchOrFocus("/Applications/Arc.app")
	end
end)

hs.hotkey.bind({ "ctrl" }, "i", function()
	local cursor = hs.application.find("cursor")
	if cursor and cursor:isFrontmost() then
		cursor:hide()
	else
		hs.application.launchOrFocus("/Applications/Cursor.app")
	end
end)

hs.hotkey.bind({ "ctrl" }, ";", function()
	local app = hs.application.find("wezterm")
	if app and app:isFrontmost() then
		app:hide()
	else
		hs.application.launchOrFocus("/Applications/WezTerm.app")
	end
end)

hs.hotkey.bind({ "ctrl" }, "m", function()
	local app = hs.application.find("music")
	if app and app:isFrontmost() then
		app:hide()
	else
		hs.application.launchOrFocus("Music")
	end
end)

hs.hotkey.bind({ "ctrl" }, "n", function()
	local app = hs.application.find("messages")
	if app and app:isFrontmost() then
		app:hide()
	else
		hs.application.launchOrFocus("Messages")
	end
end)
