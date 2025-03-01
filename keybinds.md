### General Bindings

| Key Combination       | Action Description                           | Command/Parameter         |
| --------------------- | -------------------------------------------- | ------------------------- |
| **Mod + Enter**       | Launch terminal                              | `exec $terminal`          |
| **Mod + Q**           | Kill the active window                       | `killactive`              |
| **Mod + S**           | Toggle floating mode                         | `togglefloating`          |
| **Mod + F**           | Toggle fullscreen mode                       | `fullscreen`              |
| **Mod + Space**       | Launch menu                                  | `exec $menu`              |
| **Mod + C**           | Cycle through windows                        | `exec $cycle_windows`     |
| **Mod + Tab**         | Switch to the previous workspace             | `exec $prev_workspace`    |
| **Mod + T**           | Execute pseudo action (custom functionality) | `pseudo`                  |
| **Mod + J**           | Toggle split view                            | `togglesplit`             |
| **Mod + Shift + S**   | Take a screenshot of an area                 | `exec $take-ss-area`      |
| **Mod + Shift + C**   | Launch HyprPicker                            | `exec $hyprpicker`        |
| **Mod + Left Arrow**  | Move focus to the left                       | `movefocus l`             |
| **Mod + Right Arrow** | Move focus to the right                      | `movefocus r`             |
| **Mod + Up Arrow**    | Move focus upward                            | `movefocus u`             |
| **Mod + Down Arrow**  | Move focus downward                          | `movefocus d`             |
| **Mod + 1**           | Switch to workspace 1                        | `workspace 1`             |
| **Mod + 2**           | Switch to workspace 2                        | `workspace 2`             |
| **Mod + 3**           | Switch to workspace 3                        | `workspace 3`             |
| **Mod + 4**           | Switch to workspace 4                        | `workspace 4`             |
| **Mod + 5**           | Switch to workspace 5                        | `workspace 5`             |
| **Mod + Shift + 1**   | Move window silently to workspace 1          | `movetoworkspacesilent 1` |
| **Mod + Shift + 2**   | Move window silently to workspace 2          | `movetoworkspacesilent 2` |
| **Mod + Shift + 3**   | Move window silently to workspace 3          | `movetoworkspacesilent 3` |
| **Mod + Shift + 4**   | Move window silently to workspace 4          | `movetoworkspacesilent 4` |
| **Mod + Shift + 5**   | Move window silently to workspace 5          | `movetoworkspacesilent 5` |
| **Mod + Mouse Down**  | Switch workspace (edge increment: next)      | `workspace e+1`           |
| **Mod + Mouse Up**    | Switch workspace (edge decrement: previous)  | `workspace e-1`           |

### Mouse Bindings

| Key Combination            | Action        | Command/Parameter |
| -------------------------- | ------------- | ----------------- |
| **Mod + Mouse Button 272** | Move window   | `movewindow`      |
| **Mod + Mouse Button 273** | Resize window | `resizewindow`    |

### Audio Bindings

| Key Combination             | Action                 | Command/Parameter                                   |
| --------------------------- | ---------------------- | --------------------------------------------------- |
| **XF86 Audio Raise Volume** | Increase volume by 5%  | `exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+`    |
| **XF86 Audio Lower Volume** | Decrease volume by 5%  | `exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-`    |
| **XF86 Audio Mute**         | Toggle audio mute      | `exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle`   |
| **XF86 Audio Mic Mute**     | Toggle microphone mute | `exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle` |

### Media Bindings

| Key Combination             | Action              | Command/Parameter           |
| --------------------------- | ------------------- | --------------------------- |
| **XF86 Audio Next**         | Play next track     | `exec playerctl next`       |
| **XF86 Audio Pause / Play** | Toggle play/pause   | `exec playerctl play-pause` |
| **XF86 Audio Previous**     | Play previous track | `exec playerctl previous`   |
