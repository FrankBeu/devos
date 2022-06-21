''
#################################################################################################### FLAMESHOT
set $mode_flameshot  flameshot  🄹GUI  🄺SINGLE  🄻FULL  ⓈDELAYED
# set $mode_flameshot  NAME  🅈ACTION  🅄ACTION  🄸ACTION  🄾ACTION  🄿ACTION  🄷ACTION  🄹ACTION  🄺ACTION  🄻ACTION  ⓈACTION  🄽ACTION  🄼ACTION  ⒸACTION  ⓅACTION  ⓁACTION

mode "$mode_flameshot" {
    # bindsym     $mod+y          mode "mode_flameshot", exec --no-startup-id
    # bindsym     $mod+u          mode "mode_flameshot", exec --no-startup-id
    # bindsym     $mod+i          mode "mode_flameshot", exec --no-startup-id
    # bindsym     $mod+o          mode "mode_flameshot", exec --no-startup-id
    # bindsym     $mod+p          mode "mode_flameshot", exec --no-startup-id

    # bindsym     $mod+h          mode "mode_flameshot", exec --no-startup-id
    bindsym       $mod+j          mode "default",        exec --no-startup-id flameshot gui             ### selection
    bindsym       $mod+k          mode "default",        exec --no-startup-id flameshot screen -c       ### screen  single
    bindsym       $mod+l          mode "default",        exec --no-startup-id flameshot full   -c       ### screens all
    bindsym       $mod+semicolon  mode "default",        exec --no-startup-id flameshot gui    -d 2000  ### delayed 2s
    ### TODO cursor can be shown in wayland

    # bindsym     $mod+n          mode "mode_flameshot", exec --no-startup-id
    # bindsym     $mod+m          mode "mode_flameshot", exec --no-startup-id
    # bindsym     $mod+comma      mode "mode_flameshot", exec --no-startup-id
    # bindsym     $mod+period     mode "mode_flameshot", exec --no-startup-id
    # bindsym     $mod+slash      mode "mode_flameshot", exec --no-startup-id
    # bindsym     $mod+slash      mode "default",        exec --no-startup-id


    ### back2normalMode
    bindsym            Return     mode "default"
    bindsym            Escape     mode "default"
    bindsym       $mod+Return     mode "default"
    bindsym       $mod+Escape     mode "default"
}
bindsym       $mod+period     mode "$mode_flameshot" ''

### TODO doc



# Local Variables:
# mode: conf-unix
# eval:(rainbow-mode 1)
# eval:(hl-todo-mode 1)
# End:
