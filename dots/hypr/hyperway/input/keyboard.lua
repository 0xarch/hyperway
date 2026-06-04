if os.getenv("HYPERWAY_INPUT_KEYBOARD") == "1" then
	hl.config({
		input = {
			repeat_delay = 250,
			repeat_rate = 35,
			follow_mouse = 1,
		},
	})
end
