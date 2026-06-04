if os.getenv("HYPERWAY_KEYBIND_SUGGESTAPP") == "1" then
	hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"))
	hl.bind("SUPER + W", hl.dsp.exec_cmd("chromium"))
	hl.bind("SUPER + M", hl.dsp.exec_cmd("pavucontrol-qt"))
end
