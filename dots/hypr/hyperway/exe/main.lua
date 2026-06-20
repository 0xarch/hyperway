CONFIG_DIR = "~/.config/hypr/hyperway"

EXE_DIR = CONFIG_DIR .. "/exe"

if os.getenv("HYPERWAY_APPEARANCE") then
	EXE_DIR = CONFIG_DIR .. "/appearance/" .. os.getenv("HYPERWAY_APPEARANCE")
end

if os.getenv("HYPERWAY_EXE_DEFAULT") == "1" then
	hl.on("hyprland.start", function()
		if os.getenv("HYPERWAY_APPEARANCE") == "" then
			hl.exec_cmd("mako -c " .. EXE_DIR .. "/mako/config")
			hl.exec_cmd(EXE_DIR .. "/waybar/start.sh")
			hl.exec_cmd(
				"swayosd-server --config " .. EXE_DIR .. "/swayosd/config.toml -s " .. EXE_DIR .. "/swayosd/style.css"
			)
			hl.exec_cmd("wl-paste --watch cliphist store")
			hl.exec_cmd(CONFIG_DIR .. "/util/darkmode/wallpaper.sh")
			hl.exec_cmd(CONFIG_DIR .. "/util/listener/event-listener")
		end

		-- INTEGRATIONS --
		hl.exec_cmd("fcitx5 -d")
		hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
		hl.exec_cmd("/usr/lib/xdg-desktop-portal")
		hl.exec_cmd("kded6")
	end)
end
