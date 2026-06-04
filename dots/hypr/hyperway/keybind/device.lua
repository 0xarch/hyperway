if os.getenv("HYPERWAY_KEYBIND_DEVICE") == "1" then
	hl.bind(
		"XF86MonBrightnessUp",
		hl.dsp.exec_cmd("swayosd-client --brightness raise"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86MonBrightnessDown",
		hl.dsp.exec_cmd("swayosd-client --brightness lower"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioRaiseVolume",
		hl.dsp.exec_cmd("swayosd-client --output-volume raise"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioLowerVolume",
		hl.dsp.exec_cmd("swayosd-client --output-volume lower"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioMute",
		hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),
		{ locked = true, repeating = true }
	)
	hl.bind(
		"XF86AudioMicMute",
		hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"),
		{ locked = true, repeating = true }
	)
end
