''
#################################################################################################### GOPASS

bindsym $mod+shift+g exec --no-startup-id "alacritty --class gopass,gopass"
for_window [class="gopass"] floating enable
for_window [class="gopass"] resize set 700 200

### ONE OF MONITOR-Y-X
### LTL LTM LTR RTL RTM RTR
### LML LMM LMR RML RMM RMR
### LBL LBM LBR RBL RBM RBR

for_window [class="gopass"] exec --no-startup-id ~/.local/share/i3/windowToAnchor RBR ''


# Local Variables:
# mode: conf-unix
# eval:(hl-todo-mode 1)
# End:
