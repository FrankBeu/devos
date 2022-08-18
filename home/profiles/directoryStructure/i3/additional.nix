''
#################################################################################################### DIRECTORY-STRUCTURE
set $mode_dirStruct  dirs  🅄USER  🄸MACHINE    🄷SCRATCH  🄹DEVOS  🄺AKTUELLES  🄻ROUTINES
# set $mode_dirStruct  NAME  🅈ACTION  🅄ACTION  🄸ACTION  🄾ACTION  🄿ACTION  🄷ACTION  🄹ACTION  🄺ACTION  🄻ACTION  ⓈACTION  🄽ACTION  🄼ACTION  ⒸACTION  ⓅACTION  ⓁACTION

mode "$mode_dirStruct" {
    # bindsym     $mod+y          mode "default", exec --no-startup-id
    bindsym       $mod+u          mode "default", exec --no-startup-id emacsclient -nc -a "" ~/DEVOS/hosts/ryzen/home
    bindsym       $mod+i          mode "default", exec --no-startup-id emacsclient -nc -a "" ~/DEVOS/hosts/ryzen/system.nix
    # bindsym     $mod+o          mode "default", exec --no-startup-id
    # bindsym     $mod+p          mode "default", exec --no-startup-id

    bindsym       $mod+h          mode "default", exec --no-startup-id exec emacsclient -nc -a ""
    bindsym       $mod+j          mode "default", exec --no-startup-id alacritty -e ranger ~/DEVOS
    bindsym       $mod+k          mode "default", exec --no-startup-id exec emacsclient -nc -a "" ~/NOTES/AKTUELLES.org; workspace $WS1;
    bindsym       $mod+l          mode "default", exec --no-startup-id exec emacsclient -nc -a "" ~/ROUTINES/ROUTINES.org;  workspace $WS1;
    # bindsym     $mod+semicolon  mode "default", exec --no-startup-id

    # bindsym     $mod+n          mode "default", exec --no-startup-id
    # bindsym     $mod+m          mode "default", exec --no-startup-id
    # bindsym     $mod+comma      mode "default", exec --no-startup-id
    # bindsym     $mod+period     mode "default", exec --no-startup-id
    # bindsym     $mod+slash      mode "default", exec --no-startup-id
    # bindsym     $mod+slash      mode "default", exec --no-startup-id


    ### back2normalMode
    bindsym            Return     mode "default"
    bindsym            Escape     mode "default"
    bindsym       $mod+Return     mode "default"
    bindsym       $mod+Escape     mode "default"
}
bindsym       $mod+slash      mode "$mode_dirStruct" ''
### TODO doc



# Local Variables:
# mode: conf-unix
# eval:(hl-todo-mode 1)
# End:
