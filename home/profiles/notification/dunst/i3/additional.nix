''#################################################################################################### DUNST
set $mode_dunst  dunst  🅄debug  🄽action  🄼context  🄺hist-pop  🄻close  Ⓢclose-all
# set $mode_dunst  dunst  🅄debug  🄽action  🄼context  🄺hist-pop  🄻close  Ⓢclose-all  Ⓒtoggle  Ⓟstatus
#  🄹rule

# 🅈🅄🄸🄾🄿🄷🄹🄺🄻Ⓢ🄽🄼ⒸⓅⓁ
mode "$mode_dunst" {



    # bindsym     $mod+y          mode "default",    exec --no-startup-id
    bindsym       $mod+u          mode "mode_dunst", exec --no-startup-id dunstify "$( dunstctl debug )" ### Print debugging information
    bindsym       $mod+shift+u    mode "mode_dunst", exec --no-startup-id dunstify "$( dunstify -s )"    ### Print server information
    # bindsym     $mod+i          mode "default",    exec --no-startup-id
    # bindsym     $mod+o          mode "default",    exec --no-startup-id
    # bindsym     $mod+p          mode "default",    exec --no-startup-id

    # bindsym     $mod+h          mode "default",    exec --no-startup-id
    ### TODO RULES
    # bindsym     $mod+j          mode "mode_dunst"  exec --no-startup-id
    bindsym       $mod+k          mode "mode_dunst", exec --no-startup-id dunstctl history-pop  ### Pop the latest notification from history or optionally the notification with given ID.
    bindsym       $mod+l          mode "mode_dunst", exec --no-startup-id dunstctl close        ### Close the last notification
    bindsym       $mod+semicolon  mode "default",    exec --no-startup-id dunstctl close-all    ### Close the all notifications

    ### Perform the default action, or open the context menu of the notification at the given position; first is 0; urls not useable ### DO-NOT-APPEND-THE-COMMENT
    bindsym       $mod+n          mode "default",    exec --no-startup-id dunstctl action 0
    bindsym       $mod+m          mode "default",    exec --no-startup-id dunstctl context      ### Open context menu
    # bindsym     $mod+comma      mode "default",    exec --no-startup-id
    # bindsym     $mod+period     mode "default",    exec --no-startup-id
    # bindsym     $mod+slash      mode "default",    exec --no-startup-id


    # bindsym     $mod+comma      mode "default",    exec --no-startup-id dunstify "$( dunstctl is-paused | sed 's/false/Notifications disabled/' | sed 's/true/Notifications enabled/' )" && sleep 1 && dunstctl set-paused toggle  ### Set the pause status[true|false|toggle]
    # bindsym     $mod+period     mode "default",    exec --no-startup-id dunstify "$( dunstctl is-paused | sed 's/false/Notifications disabled/' | sed 's/true/Notifications enabled/' )"                                           ### Check if dunst is running or paused
    # bindcode    $mod+59         mode "default",    exec --no-startup-id dunstify "$( dunstctl is-paused | sed 's/false/Notifications disabled/' | sed 's/true/Notifications enabled/' )" && sleep 1 && dunstctl set-paused toggle  ### Set the pause status[true|false|toggle]
    # bindcode    $mod+60         mode "default",    exec --no-startup-id dunstify "$( dunstctl is-paused | sed 's/false/Notifications disabled/' | sed 's/true/Notifications enabled/' )"                                           ### Check if dunst is running or paused


    ### back2normalMode
    bindsym            Return     mode "default"
    bindsym            Escape     mode "default"
    bindsym       $mod+Return     mode "default"
    bindsym       $mod+Escape     mode "default"
}
bindsym       $mod+m          mode "$mode_dunst" ''
# set $mode_dunst_rule dunstRule (k) toggle, (l) enable, (;) disable
# mode "$mode_dunst_rule" {
#     bindsym $mod+k         mode "default", exec --no-startup-id dunstctl rule name toggle   ### Toggle  a rule by its name
#     bindsym $mod+l         mode "default", exec --no-startup-id dunstctl rule name enable   ### Enable  a rule by its name
#     bindsym $mod+semicolon mode "default", exec --no-startup-id dunstctl rule name disable  ### Disable a rule by its name
# }


### TODO doc
### https://dunst-project.org/documentation/
### https://github.com/dunst-project/dunst
### TODO patch action indicators
### notify-send:
### notify-send ' this is a test'
### notify-send "Time" "\n<a href=\"https://time.is/no/Oslo\">blah</a>"
### notify-send "Time" '\n<a href=\"https://time.is/no/Oslo\">blah</a>'
### notify-send "Test" "<a href=\"https://forums.bunsenlabs.org/\">BL</a>"
### notify-send "Test" "<a href='https://forums.bunsenlabs.org/'>BL</a>" ### NOT WORKING
### usecase actions??
### https://github.com/budlabs/youtube/tree/master/letslinux/044-dunstify
### https://www.youtube.com/watch?v=rMc0yWiUPfc
### context-menu open browser
### go: https://github.com/gen2brain/dlgs
###     https://github.com/gen2brain/beeep
### dunstify:
### dunstify 'test' -u low
### dunstify 'test' -u normal
### dunstify 'test' -u critical
### actions:
### dunstify --action="replyAction,reply" "Message received"
### dunstify -a update -A Y,yes -A N,no "updates"
### call dunstctl context - dmenu will open; TODO style
### use arrows or answers to reply
### https://www.youtube.com/watch?v=GX_LGfuojcE emacs



# Local Variables:
#  mode: conf-unix
#  End:
