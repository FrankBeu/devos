# { ... }:
''#################################################################################################### ROFI
set $mode_rofi rofi  🅈power  🄹combi  🄺run  🄻emoji  Ⓢcalc  🄼clip  Ⓒdrun  Ⓟwindow  Ⓛssh
#  🅄pass  🄸name  🄾comment  🄿commands
#  🄷systemd
#  🄽mpd

mode "$mode_rofi" {
    ### BAK
    ### bindsym   $mod+2                          exec . /home/frank/.config/rofi/cmds/rofiGopass.zsh Password
    ### bindsym   $mod+3                          exec . /home/frank/.config/rofi/cmds/rofiGopass.zsh Username
    ### bindsym   $mod+4                          exec . /home/frank/.config/rofi/cmds/rofiGopass.zsh Comment

    ### TODO icons
    # bindsym     $mod+y          mode "default", exec --no-startup-id rofi -show menu -modi "menu:rofi-power-menu --choices=shutdown/reboot"
    # bindsym     $mod+y          mode "default", exec --no-startup-id rofi -show p -modi p:rofi-power-menu -theme Paper -font "JetBrains Mono NF 16" -width 20 -lines 6
    # bindsym     $mod+y          mode "default", exec --no-startup-id rofi -show p -modi p:rofi-power-menu -font "JetBrainsMono 26"
    bindsym       $mod+y          mode "default", exec --no-startup-id rofi -show p -modi p:rofi-power-menu

    bindsym       $mod+u          mode "default", exec --no-startup-id . ~/.local/share/rofi/commands/rofiGopass.zsh Password
    bindsym       $mod+i          mode "default", exec --no-startup-id . ~/.local/share/rofi/commands/rofiGopass.zsh Username
    bindsym       $mod+o          mode "default", exec --no-startup-id . ~/.local/share/rofi/commands/rofiGopass.zsh Comment
    bindsym       $mod+p          mode "default", exec --no-startup-id ~/.local/share/rofi/commands/rofiGopass.zsh


    ### TODO
    # bindsym     $mod+h          mode "default", exec --no-startup-id "rofi-systemd"
    # bindsym     $mod+h          mode "default", exec --no-startup-id "ROFI_SYSTEMD_TERM=alacritty rofi-systemd"
    bindsym       $mod+j          mode "default", exec --no-startup-id "rofi -show combi"
    bindsym       $mod+k          mode "default", exec --no-startup-id "rofi -show run"
    bindsym       $mod+l          mode "default", exec --no-startup-id "rofi -show emoji -modi emoji"
    bindsym       $mod+semicolon  mode "default", exec --no-startup-id "rofi -show calc -modi calc -no-show-match -no-sort"


    # bindsym     $mod+n          mode "default", exec --no-startup-id "rofi-mpd -h"
    bindsym       $mod+m          mode "default", exec --no-startup-id "CM_LAUNCHER=rofi clipmenu -show clip"
    bindsym       $mod+comma      mode "default", exec --no-startup-id "rofi -show drun"
    bindsym       $mod+period     mode "default", exec --no-startup-id "rofi -show window"
    bindsym       $mod+slash      mode "default", exec --no-startup-id "rofi -show ssh"
    # bindsym     $mod+slash      mode "default",   exec --no-startup-id


    ### back2normalMode
    bindsym            Return     mode "default"
    bindsym            Escape     mode "default"
    bindsym       $mod+Return     mode "default"
    bindsym       $mod+Escape     mode "default"
}
bindsym       $mod+comma      mode "$mode_rofi" ''
# bindsym shift+$mod+e mode "default", exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"


### TODO doc
### TODO plugins
# bindsym $mod+4 exec --no-startup-id "rofi-surfraw"
### https://github.com/davatorium/rofi-scripts/blob/master/rofi-surfraw/rofi-surfraw
# bindsym $mod+4 exec --no-startup-id "rofi-gopass"
### https://github.com/samedamci/rofi-mpd
### https://github.com/svenstaro/rofi-calc
# https://github.com/carnager/rofi-pass
### https://github.com/IvanMalison/rofi-systemd
### https://github.com/cdown/clipmenu
### https://github.com/jluttine/rofi-power-menu
### TODO icons https://github.com/jluttine/rofi-power-menu/blob/master/rofi-power-menu
### rofi-surfraw



# Local Variables:
# mode: conf-space
# eval:(rainbow-mode 1)
# eval:(hl-todo-mode 1)
# End:
