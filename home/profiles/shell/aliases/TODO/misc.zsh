#################################################################################
###
##
# * misc
#


###
##
# ** audio
#
alias biet='pacmd set-default-source alsa_input.usb-Bietrun_two_Bietrun_two_Bietrun_two-00.mono-fallback'


###
##
# ** cal
#
#     today
alias calt='cal -m   | \grep -C6 --color " $(date +%e)\b"'
#     weekMonday
alias calwm='cal -wm | \grep -C6 --color " $(date +%e)\b"'


###
##
# ** camshot:Video -> Take Snapshot
#
alias camshot='vlc v4l:// :v4l-vdev="/dev/video0" :v4l-adev="/dev/audio2"'


###
##
# ** disk-free
#
alias dfo="df --output"


###
##
# ** DOCKER
#
if [ -x "$(command -v docker)" ]; then
    alias dkka="docker kill $(echo -n $(docker ps -q))"
    alias dkl='dkls --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}"'
    alias dkclc="dkcl -f --tail=1|ccze -A"
fi


###
##
# ** draw.io
#
alias draw='draw.io'


###
##
# ** fd - FinD
# *** color
#
alias fdc='fd -calways'


###
##
# ** gilt
#
alias gilt="go-gilt --giltdir ${XDG_DATA_HOME}/gilt/clone"
alias gilto="go-gilt --giltdir ${XDG_DATA_HOME}/gilt/clone overlay"


###
##
# ** ip,external
#
alias extIP='curl http://checkip.amazonaws.com/'


###
##
# ** metasploit
#
# alias msfc="msfconsole --quiet -x \"db_connect ${USER}@msf\""
### disable banner
# alias msfconsole="msfconsole --quiet -x \"db_connect ${USER}@msf\""
# alias msfc="msfconsole --quiet"


###
##
# ** multitail
#
alias multitail='multitail -F ~/.config/multitail/multitail.conf -D'
alias mt='multitail -F ~/.config/multitail/multitail.conf -D -cS '
alias mtg='multitail -F ~/.config/multitail/multitail.conf -D -cS zap'


###
##
# ** rclip
#
alias rhclb='rc sc'


###
##
# ** RUST-Tools
#
alias find='fd'
alias grep='rga'
alias du='dust'
alias cat='/usr/bin/env bat'
alias time='hyperfine'
alias /usr/bin/time='hyperfine'
alias cloc='tokei'
alias ps='procs'
# alias sed='sd'
alias top='btm'
alias htop='btm'


###
##
# ** ssha - ssh-add
#
alias ssha='ssh-add'


###
##
# ** go-task
#    conflicts with tanka
#
# alias tk='go-task'


