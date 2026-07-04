if os.getenv("HYPERWAY_WORKSPACE_DEFAULTRULE") == "1" then
	hl.window_rule({ match = { class = ".*" }, no_blur = true })
	hl.window_rule({ match = { class = "^()$", title = "^()$" }, no_blur = true })
	hl.window_rule({ match = { title = ".*\\.exe" }, immediate = true })
	hl.window_rule({ match = { title = ".*minecraft.*" }, immediate = true })
	hl.window_rule({ match = { class = "^(steam_app).*" }, immediate = true })
	hl.window_rule({ match = { class = "org.freedesktop.impl.*" }, float = true })
	hl.window_rule({ match = { class = "org.jackhuang.hmcl.Launcher" }, float = true, decorate = false })

	hl.layer_rule({ match = { namespace = "gtk4-layer-shell" }, no_anim = true })
end
