require("hyperway.workspace.defaultrule")

WORKSPACE_COUNT = os.getenv("HYPERWAY_WORKSPACE_COUNT", 10)

for i = 1, WORKSPACE_COUNT do
	hl.bind("SUPER + " .. (i % WORKSPACE_COUNT), hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. (i % WORKSPACE_COUNT), hl.dsp.window.move({ workspace = i }))
	hl.bind("SUPER + ALT + " .. (i % WORKSPACE_COUNT), hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.config({
	misc = {
		focus_on_activate = true,
	},
})
