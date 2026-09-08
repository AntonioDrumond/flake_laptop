hl.monitor({
    output = "eDP-1",
    mode = "1920x1080",
    position = "0x0",
    scale = "1.5",

})

hl.monitor({
    output = "DP-1",
    mode = "1920x1080",
    position = "-1920x0",
    scale = "1.0",
})

Terminal = "kitty"
FileManager = "dolphin"
Menu = "rofi -show drun"

hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar & hyprpaper & hypridle")
    hl.exec_cmd("xrandr --output eDP-1 --primary")
    hl.exec_cmd("otd-daemon")
    hl.exec_cmd("echo \"/home/antonio/\" > /tmp/anchor.txt")
end)

hl.env("XCURSOR_SIZE", "20")
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("GDK_BACKEND", "wayland, x11")

hl.config({

    general = {
        gaps_in = 2,
        gaps_out = 2,
        border_size = 1,

        col = {
            active_border = {
                colors = {
                    "rgba(33c0ffee)",
                    "rgba(4214d9ee)",
                },
                angle = 60,
            },
            inactive_border = "rgba(595959aa)"
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 6,
        rounding_power = 4,
        active_opacity = 1.0,
        inactive_opacity = 1.95,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,

            vibrancy = 0.1696,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    xwayland = {
        create_abstract_socket = true,
        force_zero_scaling = true,
    },

    input = {
        kb_layout = "br,us",
        kb_variant = "abnt2,",

        kb_options = "grp:win_space_toggle",

        follow_mouse = 1,

        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
            disable_while_typing = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Basic binds
hl.bind("SUPER + CTRL + T", hl.dsp.exec_cmd(Terminal))
hl.bind("SUPER + CTRL + SHIFT + T", hl.dsp.exec_cmd("kitty -d $(cat /tmp/anchor.txt)"))
hl.bind("SUPER + X", hl.dsp.window.kill())
hl.bind("SUPER + SHIFT + M", hl.dsp.exit())
hl.bind("SUPER + E", hl.dsp.exec_cmd("kitty --execute yazi"))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd(FileManager))
hl.bind("SUPER + V", hl.dsp.window.float())
hl.bind("SUPER + R", hl.dsp.exec_cmd(Menu))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind("SUPER + CTRL + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("CTRL + SHIFT + O", hl.dsp.exec_cmd("/home/antonio/.local/bin/open_obsidian_current.sh"))
hl.bind("SUPER + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only --silent"))
hl.bind("SUPER + CTRL + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region --silent"))
hl.bind("SUPER + CTRL + LEFT", hl.dsp.focus({ workspace = "e-1"}))
hl.bind("SUPER + CTRL + RIGHT", hl.dsp.focus({ workspace = "e+1"}))
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd("kitty --execute btop"))

-- Hide waybar or not
-- hl.bind("SUPER + B", hl.dsp.exec_cmd("/home/antonio/.config/waybar/autohide.sh"))
-- hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("/home/antonio/.config/waybar/launch.sh"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("/home/antonio/.local/bin/autohide --window-detect --name .waybar-wrapped"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("waybar"))
hl.bind("SUPER + CTRL + B", hl.dsp.exec_cmd("/home/antonio/.config/waybar/noWaybar.sh"))

-- Move focus

local l = { direction = "left" }
local r = { direction = "right" }
local u = { direction = "up" }
local d = { direction = "down" }

hl.bind("SUPER + H", hl.dsp.focus(l))
hl.bind("SUPER + L", hl.dsp.focus(r))
hl.bind("SUPER + K", hl.dsp.focus(u))
hl.bind("SUPER + J", hl.dsp.focus(d))
hl.bind("SUPER + LEFT", hl.dsp.focus(l))
hl.bind("SUPER + RIGHT", hl.dsp.focus(r))
hl.bind("SUPER + UP", hl.dsp.focus(u))
hl.bind("SUPER + DOWN", hl.dsp.focus(d))

local ws = {
    {workspace = 1},
    {workspace = 2},
    {workspace = 3},
    {workspace = 4},
    {workspace = 5},
    {workspace = 6},
    {workspace = 7},
    {workspace = 8},
    {workspace = 9},
    {workspace = 10},
    {workspace = 11},
    {workspace = 12},
    {workspace = 13},
    {workspace = 14},
    {workspace = 15},
    {workspace = 16},
    {workspace = 17},
    {workspace = 18},
    {workspace = 19},
    {workspace = 20},
}

-- Switch workspaces with mainMod.." + + [0-9]
hl.bind(mainMod.." + 1", hl.dsp.focus(ws[1]))
hl.bind(mainMod.." + 2", hl.dsp.focus(ws[2]))
hl.bind(mainMod.." + 3", hl.dsp.focus(ws[3]))
hl.bind(mainMod.." + 4", hl.dsp.focus(ws[4]))
hl.bind(mainMod.." + 5", hl.dsp.focus(ws[5]))
hl.bind(mainMod.." + 6", hl.dsp.focus(ws[6]))
hl.bind(mainMod.." + 7", hl.dsp.focus(ws[7]))
hl.bind(mainMod.." + 8", hl.dsp.focus(ws[8]))
hl.bind(mainMod.." + 9", hl.dsp.focus(ws[9]))
hl.bind(mainMod.." + 0", hl.dsp.focus(ws[10]))
hl.bind(mainMod.." + CTRL + 1", hl.dsp.focus(ws[11]))
hl.bind(mainMod.." + CTRL + 2", hl.dsp.focus(ws[12]))
hl.bind(mainMod.." + CTRL + 3", hl.dsp.focus(ws[13]))
hl.bind(mainMod.." + CTRL + 4", hl.dsp.focus(ws[14]))
hl.bind(mainMod.." + CTRL + 5", hl.dsp.focus(ws[15]))
hl.bind(mainMod.." + CTRL + 6", hl.dsp.focus(ws[16]))
hl.bind(mainMod.." + CTRL + 7", hl.dsp.focus(ws[17]))
hl.bind(mainMod.." + CTRL + 8", hl.dsp.focus(ws[18]))
hl.bind(mainMod.." + CTRL + 9", hl.dsp.focus(ws[19]))
hl.bind(mainMod.." + CTRL + 0", hl.dsp.focus(ws[20]))

-- Faz o resto de 1 pra 20 ai

-- Move window to workspace
hl.bind(mainMod.." + SHIFT + 1", hl.dsp.window.move(ws[1]))
hl.bind(mainMod.." + SHIFT + 2", hl.dsp.window.move(ws[2]))
hl.bind(mainMod.." + SHIFT + 3", hl.dsp.window.move(ws[3]))
hl.bind(mainMod.." + SHIFT + 4", hl.dsp.window.move(ws[4]))
hl.bind(mainMod.." + SHIFT + 5", hl.dsp.window.move(ws[5]))
hl.bind(mainMod.." + SHIFT + 6", hl.dsp.window.move(ws[6]))
hl.bind(mainMod.." + SHIFT + 7", hl.dsp.window.move(ws[7]))
hl.bind(mainMod.." + SHIFT + 8", hl.dsp.window.move(ws[8]))
hl.bind(mainMod.." + SHIFT + 9", hl.dsp.window.move(ws[9]))
hl.bind(mainMod.." + SHIFT + 0", hl.dsp.window.move(ws[10]))
hl.bind(mainMod.." + CTRL + SHIFT + 1", hl.dsp.window.move(ws[11]))
hl.bind(mainMod.." + CTRL + SHIFT + 2", hl.dsp.window.move(ws[12]))
hl.bind(mainMod.." + CTRL + SHIFT + 3", hl.dsp.window.move(ws[13]))
hl.bind(mainMod.." + CTRL + SHIFT + 4", hl.dsp.window.move(ws[14]))
hl.bind(mainMod.." + CTRL + SHIFT + 5", hl.dsp.window.move(ws[15]))
hl.bind(mainMod.." + CTRL + SHIFT + 6", hl.dsp.window.move(ws[16]))
hl.bind(mainMod.." + CTRL + SHIFT + 7", hl.dsp.window.move(ws[17]))
hl.bind(mainMod.." + CTRL + SHIFT + 8", hl.dsp.window.move(ws[18]))
hl.bind(mainMod.." + CTRL + SHIFT + 9", hl.dsp.window.move(ws[19]))
hl.bind(mainMod.." + CTRL + SHIFT + 0", hl.dsp.window.move(ws[20]))

-- Example special workspace (scratchpad)
hl.bind(mainMod.." + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod.." + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
local ep = { workspace = "e+1" }
local em = { workspace = "e-1" }

hl.bind(mainMod.." + mouse_down", hl.dsp.focus(ep))
hl.bind(mainMod.." + mouse_up", hl.dsp.focus(em))

-- Move/resize windows with mainMod.." + + LMB/RMB and dragging
hl.bind(mainMod.." + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod.." + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod.." + CTRL + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Multimedia keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))

-- Playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

hl.curve("easeOutQuint", { type = "bezier", points = { {0.23,1}, {0.32,1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65,0.05}, {0.36,1} } })
hl.curve("linear", { type = "bezier", points = { {0,0}, {1,1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5,0.5}, {0.75,1.0} } })
hl.curve("quick", { type = "bezier", points = { {0.15,0}, {0.1,1} } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default"})
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint"})
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint"})
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%"})
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%"})
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear"})
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear"})
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick"})
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint"})
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade"})
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade"})
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear"})
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear"})
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade"})
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade"})
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade"})
-- hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4.0, bezier = "easeOutQuint", style = "slidevert"})

--[[ 
hl.layer_rule({
    name = "waybar-fix",
    match = { namespace = "^waybar$" },
    blur = true,
    ignore_alpha = 0.01
})
]]--

hl.window_rule({
    name = "supress-maximize-events",
    match = {
        class = ".*"
    },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "float qemu",
    match = {
        title = "QEMU",
    },
    float = true,
})

hl.window_rule {
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = true,
        pin = true,
    },
    no_focus = true
}

-- Bluetooth
hl.window_rule({
    match = {
        class = "blueman-manager",
    },
    float = true,
    animation = "slide top",
    move = "51% 10%",
    min_size = { 700, 400 },
    max_size = { 700, 400 },
})

-- Network 
hl.window_rule({
    match = {
        class = "nm-connection-editor",
    },
    float = true,
    animation = "slide top",
    move = "49% 10%",
    min_size = { 500, 400 },
    max_size = { 500, 400 },
})

hl.window_rule({
    match = {
        class = "nmtui",
    },
    float = true,
    animation = "slide top",
    min_size = { 800, 500 },
    max_size = { 800, 500 },
    stay_focused = true,
})

-- Audio
hl.window_rule({
    match = {
        class = "org.pulseaudio.pavucontrol",
    },
    float = true,
    animation = "slide top",
    move = "55% 10%",
    min_size = { 850, 600 },
    max_size = { 850, 600 },
})

-- Performance
hl.window_rule({
    match = {
        class = "btop",
    },
    float = true,
    animation = "popin",
    maximize = true,
})

-- Calendar
hl.window_rule({
    match = {
        class = "cal",
    },
    float = true,
    animation = "slide",
    min_size = { 225, 220 },
    max_size = { 225, 220 },
    stay_focused = true,
})

-- Set unidenfitied window to float
hl.window_rule({
    match = {
        title = "^$",
        class = "^$",
    },
    float = true,
})

--[[ Enable tearing
hl.window_rule({
    match = {
        title = "Celeste"
    },
    immediate = true
})
]]--
