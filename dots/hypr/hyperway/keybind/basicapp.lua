CONFIG_DIR = "~/.config/hypr/hyperway"
UTIL_DIR = CONFIG_DIR .. "/util"

if os.getenv("HYPERWAY_KEYBIND_BASICAPP") == "1" then
	hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))
	hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd("pkill fuzzel || fuzzel"))
	hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(UTIL_DIR .. "/screen/shot.sh '-z -m region'"))
	hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))
	hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("wlogout"))
	hl.bind("Print", hl.dsp.exec_cmd(UTIL_DIR .. "/screen/shot.sh '-z -m output -m active'"))
end
