CONFIG_DIR = "~/.config/hypr/hyperway"
UTIL_DIR = CONFIG_DIR .. "/util"

MAX_ZOOM = 10

if os.getenv("HYPERWAY_KEYBIND_UTIL") == "1" then
	hl.bind("SUPER + CTRL + SHIFT + D", hl.dsp.exec_cmd(UTIL_DIR .. "/darkmode/toggle.sh"))
	hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))

	local function zoomfunction(value)
		local zoomvalue = hl.get_config("cursor:zoom_factor")
		local new_zoomvalue = zoomvalue + value
		if new_zoomvalue > MAX_ZOOM then
			hl.config({ cursor = { zoom_factor = MAX_ZOOM } })
		elseif new_zoomvalue < 1.0 then
			hl.config({ cursor = { zoom_factor = 1.0 } })
		else
			hl.config({ cursor = { zoom_factor = new_zoomvalue } })
		end
	end
	hl.bind("CTRL + SUPER + mouse_up", function()
		zoomfunction(-0.8)
	end, { description = "Misc: Zoom out" })
	hl.bind("CTRL + SUPER + mouse_down", function()
		zoomfunction(0.8)
	end, { description = "Misc: Zoom in" })
end
