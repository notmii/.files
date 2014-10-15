from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget

class Commands(object):
    dmenu = "dmenu_run -i"
    terminal = "gnome-terminal"
    filemanager = "nautilus",
    brightness_up = 'xbacklight -inc 10',
    brightness_down = 'xbacklight -dec 10',
    volume_up = 'amixer -D pulse -q sset Master 2%+',
    volume_down = 'amixer -D pulse -q sset Master 2%-',
    volume_toggle_mute = 'amixer -D pulse -q sset Master toggle'
    # volume_up = 'amixer -c 1 -q set "IEC958",0 2dB+',
    # volume_down = 'amixer -c 1 -q set "IEC958",0 2dB-',
    # volume_toggle_mute = 'amixer -c 1 -q set "IEC959",0 toggle'

MOD = "mod4"
ALT = "mod1"

keys = [
    # Application shortcuts
    Key([MOD], "r", lazy.spawn(Commands.dmenu)),
    Key([MOD], "e", lazy.spawn(Commands.filemanager)),
    Key(["control", ALT], "t", lazy.spawn(Commands.terminal)),

    # Switch between windows in current stack pane
    Key([ALT], "Tab", lazy.layout.next()),
    Key([ALT, "shift"], "Tab", lazy.layout.previous()),

    # Move windows up or down in current stack
    Key([MOD], "Tab", lazy.layout.shuffle_down()),
    Key([MOD, "shift"], "Tab", lazy.layout.shuffle_up()),

    # multiple stack panes
    Key([MOD, "shift"], "Return", lazy.layout.toggle_split()),
    Key([MOD], "Return", lazy.spawn(Commands.terminal)),

    # Toggle between different layouts as defined below
    Key([MOD], "space", lazy.nextlayout()),
    Key([ALT], "F4", lazy.window.kill()),

    # Key([MOD, "control"], "r", lazy.restart()),
    # Key([MOD, "control"], "q", lazy.shutdown()),
    # Key([MOD], "r", lazy.spawncmd()),

    # BRIGHTNESS
    Key([], "XF86MonBrightnessUp", lazy.spawn(Commands.brightness_up)),
    Key([], "XF86MonBrightnessDown",lazy.spawn(Commands.brightness_down)),

    # VOLUME
    Key([], "XF86AudioRaiseVolume", lazy.spawn(Commands.volume_up)),
    Key([], "XF86AudioLowerVolume", lazy.spawn(Commands.volume_down)),
    Key([], "XF86AudioMute", lazy.spawn(Commands.volume_toggle_mute))
]

groups = [Group(i) for i in "1234"]

for i in groups:
    # mod1 + letter of group = switch to group
    keys.append(Key([MOD], i.name, lazy.group[i.name].toscreen()))

    # mod1 + shift + letter of group = switch to & move focused window to group
    keys.append(Key([MOD, "shift"], i.name, lazy.window.togroup(i.name)))

layouts = [
    layout.MonadTall(border_focus = '#00ffff', border_width = 1),
    layout.Max()
]

widget_defaults = dict(
    font='Monaco',
    fontsize=9,
    padding=0,
)

screens = [
    Screen(
        top = bar.Bar(
            [
                widget.GroupBox(**widget_defaults),
                widget.Prompt(**widget_defaults),
                widget.WindowName(**widget_defaults),
                widget.Systray(**widget_defaults),
                widget.Volume(**widget_defaults),
                widget.Battery(
                    energy_now_file = 'charge_now',
                    energy_full_file = 'charge_full',
                    power_now_file = 'current_now',
                    **widget_defaults
                ),
                widget.Clock(format='%a %Y-%m-%d %I:%M %p'),
                widget.TextBox(" JR Lizaso", name="default")
            ],
            30,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([MOD], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([MOD], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([MOD], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating()
auto_fullscreen = True
wmname = "qtile"
