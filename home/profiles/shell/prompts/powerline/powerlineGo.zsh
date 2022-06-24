#################################################################################################### dump prompt
###
##
#
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return   ### for tramp
#################################################################################### END dump prompt
#################################################################################################### powerlineGo
###
##
#
export PROMPTCHAR=" ❯"

function powerline_precmd() {
    eval "$(powerline-go \
    -shell zsh \
    -error $? \
    -eval \
    -modules 'host,user,venv,perms,vgo,kube,nix-shell,newline,exit,shell-var' \
    -modules-right 'cwd,git,ssh' \
    -cwd-max-depth 4 \
    -colorize-hostname \
    -shell-var PROMPTCHAR \
    -theme custom \
    )"
}

### FUNDUS
#   # -cwd-mode plain
#   # -max-width 90 \
#   # -cwd-max-depth 6 \
#   # -newline \
#   # -mode flat \

# aws, bzr, cwd, docker, docker-context, dotenv, duration, exit, fossil, gcp, git, gitlite, goenv, hg, host, jobs, kube, load, newline, nix-shell, node, perlbrew, perms, plenv, rbenv, root, shell-var, shenv, ssh, svn, termtitle, terraform-workspace, time, user, venv, vgo, wsl)
#           cwd, docker, docker-context, dotenv, duration, exit,              git,                     host, jobs,       load, newline, nix-shell, node,           perms, plenv,        root, shell-var,        ssh,                                            user, venv, vgo,    )

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

################################################################################ powerlineGo-dateime
###
##
#
# zmodload zsh/datetime

# function preexec() {
#   __TIMER=$EPOCHREALTIME
# }

# function powerline_precmd() {
#   local __ERRCODE=$?
#   local __DURATION=0

#   if [ -n $__TIMER ]; then
#     local __ERT=$EPOCHREALTIME
#     __DURATION="$(($__ERT - ${__TIMER:-__ERT}))"
#   fi

#   PS1="$(powerline-go -modules duration -duration $__DURATION -error $__ERRCODE -shell zsh)"
#   unset __TIMER
# }

################################################################################ powerlineGo-nixShell
###
##
# Workaround for nix-shell --pure
#
# if [ "$IN_NIX_SHELL" == "pure" ]; then
#     if [ -x "$HOME/.nix-profile/bin/powerline-go" ]; then
#         alias powerline-go="$HOME/.nix-profile/bin/powerline-go"
#     elif [ -x "/run/current-system/sw/bin/powerline-go" ]; then
#         alias powerline-go="/run/current-system/sw/bin/powerline-go"
#     fi
# fi
if [[ "$IN_NIX_SHELL" == "pure" ]]; then
    if [ -x "/run/current-system/sw/bin/powerline-go" ]; then
        alias powerline-go="/run/current-system/sw/bin/powerline-go"
    fi
fi

#################################################################################### END powerlineGo
