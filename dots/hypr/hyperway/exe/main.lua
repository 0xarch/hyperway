CONFIG_DIR = "~/.config/hypr/hyperway/exe/"

if os.getenv("HYPERWAY_APPEARANCE") then
	CONFIG_DIR = "~/.config/hypr/hyperway/appearance/" .. os.getenv("HYPERWAY_APPEARANCE") .. "/"
end

if os.getenv("HYPERWAY_EXE_DEFAULT") == "1" then
	hl.on("hyprland.start", function()
		hl.exec_cmd("mako -c " .. CONFIG_DIR .. "mako/config")
		hl.exec_cmd("fcitx5 -d")
		hl.exec_cmd(CONFIG_DIR .. "waybar/start.sh")
		hl.exec_cmd(
			"swayosd-server --config " .. CONFIG_DIR .. "swayosd/config.toml -s " .. CONFIG_DIR .. "swayosd/style.css"
		)
	end)
end
