DARK_MODE_SIG="'prefer-dark'"
LIGHT_MODE_SIG="'prefer-light'"

function is_dark_mode_now {
    [ "$(gsettings get org.gnome.desktop.interface color-scheme)" == "$DARK_MODE_SIG" ]
    return $?
}