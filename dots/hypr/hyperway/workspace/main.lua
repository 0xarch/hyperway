require("hyperway.workspace.defaultrule")

WORKSPACE_COUNT = os.getenv("HYPERWAY_WORKSPACE_COUNT", 10)

REGISTER_COUNT = 10

if tonumber(WORKSPACE_COUNT) < REGISTER_COUNT then
	REGISTER_COUNT = WORKSPACE_COUNT
end

for i = 1, REGISTER_COUNT do
	hl.bind("SUPER + " .. (i % 10), hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. (i % 10), hl.dsp.window.move({ workspace = i }))
	hl.bind("SUPER + ALT + " .. (i % 10), hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.config({
	misc = {
		focus_on_activate = true,
	},
})
