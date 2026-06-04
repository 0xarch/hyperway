CONFIG_DIR = "~/.config/hypr/hyperway"
UTIL_DIR = CONFIG_DIR .. "/util"

if os.getenv("HYPERWAY_KEYBIND_UTIL") == "1" then
	hl.bind("SUPER + CTRL + SHIFT + D", hl.dsp.exec_cmd(UTIL_DIR .. "/darkmode/toggle.sh"))
	hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
end
