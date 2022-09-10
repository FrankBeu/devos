!#/usr/bin/env zsh
### {{DESCRIPTION}}

dunstify -u normal "{{title}}" "\n {{DESCRIPTION}} START"
alacritty --command zsh -c '{{COMMAND-PIPEABLE}}'
dunstify -u normal "{{title}}" "\n {{DESCRIPTION}} END"
