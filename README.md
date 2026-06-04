# Hyperway

Hyperway is a set of dots that is used by 0xarch.

If you want this too:
    * Clone this repository.
    * Link `dots/hypr/hyperway` to `~/.config/hypr/hyperway`
    * Require `hyperway.main` in your `hyprland.lua` config file.

ALMOST all functions requires you to manually enable it by setting the environment variables to `1`:
    * `HYPERWAY_EXE_DEFAULT`: Set up the default startup applications. Most of these applications (except `fcitx5`) is dependencies of `hyperway-meta` which you can find in `packages` dir.
    * `HYPERWAY_INPUT_KEYBOARD`: Apply a set of tweaks to your keyboard.
    * `HYPERWAY_INPUT_TOUCHPAD`: Apply a set of tweaks to your touchpad.
    * `HYPERWAY_KEYBIND_BASICAPP`: Apply a set of keybinds to launch the specific applications. They are dependencies of `hyperway-keybind-basicapp` package.
    * `HYPERWAY_KEYBIND_CONTROL`: Apply a set of keybinds providing basic window management.
    * `HYPERWAY_KEYBIND_DEVICE`: Apply a set of keybinds providing basic device controlling (e.g. speaker and backlight).

These environment variables MUST BE FILLED, as it tells the dot how to setup the at least workable interface:
    * `HYPERWAY_APPEARANCE`: The interface. For now it has to be undefined or `swaylike`, The Swaylike appearance provides interface which looks like sway but with some improvements.
    * `HYPERWAY_WORKSPACE_COUNT`: How many workspaces you want. Keybinds for `SUPER + i`, `SUPER + SHIFT + i`, `SUPER + ALT + i` will be registered. Also waybar will display persistent workspaces in this count.

## NO CONTRIBUTION

This is the dot that SUIT MY WORKFLOW and I did as much modulizing as I can. You can copy any of these files to your own dotfile.

All configuration files (Without the README) is CC-Zero (Copyleft).