if os.getenv("HYPERWAY_INPUT_TOUCHPAD") == "1" then
	hl.config({
		input = {
			touchpad = {
				disable_while_typing = false,
				natural_scroll = true,
				clickfinger_behavior = true,
				scroll_factor = 1.2,
			},
		},
	})
end
