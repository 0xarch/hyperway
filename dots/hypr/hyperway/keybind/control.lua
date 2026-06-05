if os.getenv("HYPERWAY_KEYBIND_CONTROL") == "1" then
	-- WINDOW ACTION --
	hl.bind("SUPER + Q", hl.dsp.window.close())
	hl.bind("SUPER + SHIFT + ALT + Q", hl.dsp.exec_cmd("hyprctl kill"))

	-- FOCUS ACTION --
	for _, x in ipairs({ "left", "right", "up", "down" }) do
		hl.bind("SUPER + " .. string.upper(x), hl.dsp.focus({ direction = x }))
		hl.bind("SUPER + SHIFT + " .. string.upper(x), hl.dsp.window.move({ direction = x }))
	end
	hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "+1" }), { mouse = true })
	hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "-1" }), { mouse = true })
	hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.window.move({ workspace = "+1" }), { mouse = true })
	hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "-1" }), { mouse = true })

	-- LAYOUT ACTION --
	hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
	hl.bind("SUPER + mouse:274", hl.dsp.window.drag())
	hl.bind("SUPER + mouse:273", hl.dsp.window.resize())
	hl.bind("SUPER + ALT + Space", hl.dsp.window.float({ action = "toggle" }))
	-- SIZE ACTION --
	hl.bind("SUPER + D", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
	hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
	hl.bind("SUPER + Semicolon", hl.dsp.layout("splitratio -0.1"), { repeating = true })
	hl.bind("SUPER + Apostrophe", hl.dsp.layout("splitratio +0.1"), { repeating = true })
	-- SPECIAL WORKSPACE --
	hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special", follow = false }))
	hl.bind("SUPER + S", hl.dsp.workspace.toggle_special())
	-- END --
end
