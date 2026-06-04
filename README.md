# Hyperway

Hyperway is a set of dots that is used by 0xarch for Hyprland WM on Archlinux.

The main keybinding is inspired by [illogical-impulse](https://github.com/end-4/dots-hyprland).

If you want this too:
  * Clone this repository.
  * Install package `packages/hyperway-meta`. (This provides you the default apps and Hyprland itself)
  * Link `dots/hypr/hyperway` to `~/.config/hypr/hyperway`
  * Require `hyperway.main` in your `hyprland.lua` config file.

## Functions

Basically, after you did a simple setup with nothing modified, you can get only 10*3 registered workspace keybindings, they are:
  * `SUPER + $i`: go to workspace `i`
  * `SUPER + SHIFT + $i`: bring the current window to workspace `i` with focus
  * `SUPER + ALT + $i`: bring the current window to workspace `i`

The rest functions requires you to manually enable it by setting the environment variables to `1` and some requires other executables:
  * `HYPERWAY_EXE_DEFAULT`: Set up the default startup applications. Most of these applications (except `fcitx5`) is dependencies of `hyperway-meta`.
  * `HYPERWAY_INPUT_KEYBOARD`: Apply a set of tweaks to your keyboard.
  * `HYPERWAY_INPUT_TOUCHPAD`: Apply a set of tweaks to your touchpad.
  * `HYPERWAY_KEYBIND_BASICAPP`: Apply a set of keybinds to launch the specific applications. They are dependencies of `hyperway-keybind-basicapp` package.
  * `HYPERWAY_KEYBIND_CONTROL`: Apply a set of keybinds providing basic window management.
  * `HYPERWAY_KEYBIND_DEVICE`: Apply a set of keybinds providing basic device controlling (e.g. speaker and backlight).
  * `HYPERWAY_KEYBIND_SUGGESTAPP`: Apply a set of keybinds to launch the suggested applications. They are dependencies of `hyperway-keybind-basicapp` package.
  * `HYPERWAY_KEYBIND_UTIL`: Apply a set of keybinds related to look and feel and other things not so important.
    > Current utility binding has:
    > * `SUPER + CTRL + SHIFT + D` for toggling dark themes
    > * `SUPER + L` for `hyprlock` (If you want, you have to manually install and configure it)
  * `HYPERWAY_WORKSPACE_DEFAULTRULE`: Apply a set of rules.
    > * Disable blurring for all applications.
    > * Allow tearing for games and wine apps. Currently there are `.*minecraft.*` and `^(steam_app).*`.
    > * Disable animation for layer `gtk4-layer-shell`

These environment variables requires string or number, as it tells the dot how to setup the at least workable interface:
    * `HYPERWAY_APPEARANCE`: The interface. See [Appearance](#appearance).
    * `HYPERWAY_WORKSPACE_COUNT`: How many workspaces you want. Keybinds for `SUPER + i`, `SUPER + SHIFT + i`, `SUPER + ALT + i` will be registered. Also waybar will display persistent workspaces in this count. Defaults to 10.

## Appearance

The `HYPERWAY_APPEARANCE` specifies the appearance. It has to be set before you include Hyperway in your configuration file.

For now you can choose:
    * `swaylike`: Clean SwayWM interface, but with hyprland animations.

The default (unspecified or not included above) brings you the default configuration of a minimum DE deps: `waybar`, `swayosd`, `mako`. They are using the copied default files.

## Packages

You can find these packages in `packages` directory.

The `hyperway-meta` contains:
    * mako (autostart)
    * hyprland (start by greet daemons)
    * waybar (autostart)
    * swayosd (autostart)
    * swaybg (requires your manual configuring)

The `hyperway-keybind-basicapp` contains:
    * hyprpicker (`SUPER + SHIFT + C`)
    * kitty (`SUPER + Return`)
    * fuzzel (`SUPER`)
    * hyprshot (`SUPER + SHIFT + S` (region), `Print` (screen))

The `hyperway-keybind-suggest-app` contains:
    * dolphin (`SUPER + E`)
    * chromium (`SUPER + W`)
    * pavucontrol-qt (`SUPER + M`)
    * plasma-workspace (optionally used in waybar darkmode module, and utils, for Qt apps)

## NO CONTRIBUTION

This is the dot that SUIT MY WORKFLOW and I did as much modulizing as I can. You can copy any of these files to your own dotfile.

All configuration files (Without the README) is CC-0 (Copyleft).
