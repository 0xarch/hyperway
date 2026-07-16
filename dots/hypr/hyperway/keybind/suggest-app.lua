CONFIG_DIR = "~/.config/hypr/hyperway"
UTIL_DIR = CONFIG_DIR .. "/util"

if os.getenv("HYPERWAY_KEYBIND_SUGGESTAPP") == "1" then
	hl.bind("SUPER + E", hl.dsp.exec_cmd("if which nautilus; then nautilus; else dolphin; fi"))
	hl.bind("SUPER + W", hl.dsp.exec_cmd("chromium"))
	hl.bind("SUPER + M", hl.dsp.exec_cmd("pavucontrol-qt"))
	hl.bind(
		"SUPER + V",
		hl.dsp.exec_cmd("cliphist decode $(cliphist list | fuzzel -l 15 -d -p 'clipboard:' -I | awk '{print $1}')")
	)
	hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("wayscriber --light-draw-toggle"))
	hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd(UTIL_DIR .. "/screen/record.sh"))
end
