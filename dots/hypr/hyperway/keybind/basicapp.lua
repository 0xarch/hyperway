if os.getenv("HYPERWAY_KEYBIND_BASICAPP") == "1" then
	hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("kitty"))
	hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd("fuzzel"))
	hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))
	hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))
	hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output -m active"))
end
