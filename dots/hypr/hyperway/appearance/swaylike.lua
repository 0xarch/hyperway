if os.getenv("HYPERWAY_APPEARANCE") and string.upper(os.getenv("HYPERWAY_APPEARANCE")) == "SWAYLIKE" then
	hl.config({
		general = {
			border_size = 2,
			gaps_in = 0,
			gaps_out = 0,
			col = {
				active_border = "#4c7899",
			},
			layout = "dwindle",
			resize_on_border = true,
			hover_icon_on_border = true,
			extend_border_grab_area = 6,
		},

		decoration = {
			rounding_power = 0,
			rounding = 0,

			blur = {
				enabled = true,
				xray = true,
			},

			dim_inactive = true,
			dim_strength = 0.05,
			dim_special = 0.3,
		},

		misc = {
			disable_hyprland_logo = true,
			disable_splash_rendering = true,
			vrr = 0,
			mouse_move_enables_dpms = true,
			key_press_enables_dpms = true,
			animate_manual_resizes = false,
			animate_mouse_windowdragging = false,
			enable_swallow = false,
			swallow_regex = "(foot|kitty|allacritty|Alacritty)",
			on_focus_under_fullscreen = 2,
			allow_session_lock_restore = true,
			session_lock_xray = true,
			initial_workspace_tracking = false,
			focus_on_activate = true,
		},

		binds = {
			scroll_event_delay = 0,
			hide_special_on_workspace_change = true,
		},
	})

	hl.workspace_rule({ workspace = "special:special", gaps_out = 30 })

	hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
	hl.env("QT_QPA_PLATFORM", "wayland;xcb")
	hl.env("QT_QPA_PLATFORMTHEME", "kde")
	hl.env("XDG_MENU_PREFIX", "plasma-")
end
