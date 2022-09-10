!#/usr/bin/env zsh
### {{DESCRIPTION}}
dunstify -u normal "{{title}}" "\n {{DESCRIPTION}} START"


### INTERACTIVE SUDO
PASSWORD=$(echo -e "SETPROMPT Password, please:\t\nGETPIN\n" | \
            pinentry | \
            sed -nr '0,/^D (.+)/s//\1/p')
echo ${PASSWORD} | sudo -S {{SUDO_COMMAND}}


### MESSAGES
dunstify -u low      "{{title}}" "\n501"
dunstify -u normal   "{{title}}" "\n501"
dunstify -u critical "{{title}}" "\n501" ### sticky


dunstify -u normal "{{title}}" "\n {{DESCRIPTION}} END"
