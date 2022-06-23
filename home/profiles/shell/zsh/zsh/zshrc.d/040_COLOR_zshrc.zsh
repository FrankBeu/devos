### TODO cleanUp with colorModule > less
################################################################################
###  COLORS
#


### colors for man
#
# man() {
#   # LESS_TERMCAP_md=$'\e[01;31m' \
#     LESS_TERMCAP_md=$'\e[1;38;2;240;75;22m' \
#     LESS_TERMCAP_me=$'\e[0m' \
#     LESS_TERMCAP_se=$'\e[0m' \
#     LESS_TERMCAP_so=$'\e[01;44;33m' \
#     # LESS_TERMCAP_so=$'\e[01;44;33m' \
#     # LESS_TERMCAP_so=$'\e[1;38;5;232;48;5;240m' \
#     LESS_TERMCAP_so=$'\e[38;2;1;1;1;48;2;80;80;80m' \
#     # LESS_TERMCAP_so=$'\e[38;2;240;75;22m' \
#     LESS_TERMCAP_ue=$'\e[0m' \
#     # LESS_TERMCAP_us=$'\e[01;32m' \
#     LESS_TERMCAP_us=$'\e[01;38;2;0;0;255m' \
#     ### start manPages in DEBUG MODE i.e. display all used tags
#   # LESS_TERMCAP_DEBUG=$'\e[1;31m' \
#     command man "$@"
# }

export LESS="-R"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
# and so on

### use pygmentize to colorize sources
# export LESS="-R"
# export LESSOPEN="|pygmentize -g %s"
