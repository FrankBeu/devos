#!/usr/bin/env zsh
###
##
# * rofi-pass
#

###
##
# ** SOURCE
#    https://github.com/Algram/rofi-gopass

###
##
# ** INFO
#    Simple gopass manager with rofi
#    It displays a list of available passwords defined with gopass
#    and types them once an item is selected with enter

###
##
# ** usage
#    ./rofiGopass.zsh
#    It displays a list of available passwords defined with gopass
#    and types them once an item is selected with enter

###
##
# *** get password
#     ./rofiGopass.zsh {,Password}

###
##
# *** get ENTRY
#     ENTRIES: website [Comment, Url, Username]
#             pin     [Application, Comment]
#     ./rofiGopass.zsh <ENTRY>

if [[ -z $1 ]]; then
    ENTRY=Password
else
    ENTRY="$1"
fi

gopass ls --flat | rofi -dmenu -p gopass | xargs -i --no-run-if-empty gopass show {} ${ENTRY} | xdotool type --clearmodifiers --file -

###
##
# ** TODOS
# *** TODO get keys from misc-passwords
#
