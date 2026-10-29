-- ~/.config/hypr/hyprland.lua
-- Rewritten from your hyprlang hyprland.conf into Hyprland 0.55+'s native
-- Lua config (hyprlang/.conf support is deprecated as of 0.55).
-- Reference: https://wiki.hypr.land/Configuring/Start/

-----------------------
---- MY PROGRAMS -------
-----------------------
local mainMod    = "SUPER"
local terminal   = "kitty"
local menu       = "rofi -show drun"
local hyprpicker = "hyprpicker -a"
local ssArea     = "sh ~/dotfiles/scripts/screenshot.sh --area"
local ssFull     = "sh ~/dotfiles/scripts/screenshot.sh --full"
local toggleEww  = "sh ~/dotfiles/scripts/launch-eww.sh"

-----------------------
---- MONITORS ----------
-----------------------
-- https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-1",
    mode     = "1920x1080@74.97",
    position = "auto",
    scale    = "auto",
})

-----------------------
---- WORKSPACE RULES ---
-----------------------
-- https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })

-----------------------
---- AUTOSTART ----------
-----------------------
-- https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd(toggleEww)
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("kdeconnectd")
    hl.exec_cmd("hyprshade toggle vibrance")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("swaybg -i ~/dotfiles/assets/wallpapers/tokyonight-0.jpg")
    hl.exec_cmd("sh ~/dotfiles/scripts/udev-check.sh")
    hl.exec_cmd("rm ~/.config/fish/fish_variables")

    hl.exec_cmd("vesktop",            { workspace = "1 silent" })
    hl.exec_cmd("spotify",            { workspace = "1 silent" })
    hl.exec_cmd("firefox-devedition", { workspace = "2 silent" })
    hl.exec_cmd("qbittorrent",        { workspace = "5 silent" })
end)

-- was: exec-shutdown = systemctl --user stop hyprland-session.target
-- os.execute is used (not hl.exec_cmd) so this blocks until it finishes,
-- since Hyprland is already exiting when this fires.
hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target")
end)

-----------------------
---- ENV VARIABLES -----
-----------------------
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Original-Ice")

-----------------------
---- LOOK AND FEEL -----
-----------------------
-- https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        allow_tearing = false,
        border_size   = 2,
        col = {
            active_border   = { colors = { "rgba(F16399ee)", "rgba(7353F8ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        gaps_in          = 2.5,
        gaps_out         = 5,
        layout           = "dwindle",
        resize_on_border = false,
    },

    decoration = {
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        rounding         = 0,
    },

    animations = {
        enabled = true,
    },

    cursor = {
        no_hardware_cursors = true,
    },

    misc = {
        disable_hyprland_logo   = false,
        force_default_wallpaper = -1,
    },
})

-----------------------
---- ANIMATIONS --------
-----------------------
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",    enabled = true, speed = 1, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "fade",       enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "default" })

-----------------------
---- DWINDLE LAYOUT ----
-----------------------
-- https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
    dwindle = {
        force_split    = 2,
        preserve_split = true,
    },
})

-----------------------
---- KEYBINDINGS -------
-----------------------
-- https://wiki.hypr.land/Configuring/Basics/Binds/
-- https://wiki.hypr.land/Configuring/Basics/Dispatchers/

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + S",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F",      hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SPACE",  hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + C",      hl.dsp.window.cycle_next())
hl.bind(mainMod .. " + TAB",    hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. " + T",      hl.dsp.window.pseudo())

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(ssArea))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(ssFull))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(hyprpicker))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(toggleEww))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 5 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    -- follow = false reproduces the old movetoworkspacesilent behaviour
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-----------------------
---- MEDIA / LOCKED ----
-----------------------
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),    { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-----------------------
---- WINDOW RULES ------
-----------------------
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/
local floatClasses = {
    "^(Emulator)$",
    "^(steam)$",
    "^(vesktop)$",
    "^([Ss]potify)$",
    "^([Aa]nki)$",
    "^(.virt-manager-wrapped)$",
    "^(xdg-desktop-portal-gtk)$",
    "^(org.gnome.Nautilus)$",
    "^(org.gnome.baobab)$",
    "^(moe.launcher.an-anime-game-launcher)$",
    "^(io.bassi.Amberol)$",
    "^(org.prismlauncher.PrismLauncher)$",
    "^(net.nokyan.Resources)$",
}

for _, class in ipairs(floatClasses) do
    hl.window_rule({ match = { class = class }, float = true })
end
