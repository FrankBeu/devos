#################################################################################
###
##
# * vnc
##
###
SSH_PORT_REMOTE=62626
VNC_PORT_CLIENT=59011
VNC_PORT_SERVER=5901

alias vncl='vncserver -list'
alias vncs='vncserver :1'
# alias vncv='ssh -p ${SSH_PORT_REMOTE} -fL ${VNC_PORT_CLIENT}:localhost:${VNC_PORT_SERVER} ${IP_KUBE_HOST} sleep 10; vncviewer localhost:${VNC_PORT_CLIENT}'
alias vncv='ssh -p ${SSH_PORT_REMOTE} -fL ${VNC_PORT_CLIENT}:localhost:${VNC_PORT_SERVER} thesym.site sleep 10; vncviewer localhost:${VNC_PORT_CLIENT}'
alias vnck='vncserver -kill :1'
