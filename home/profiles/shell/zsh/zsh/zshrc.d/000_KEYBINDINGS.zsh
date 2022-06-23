################################################################################################### KEYBINDINGS
### COMPLETION
### Usage: C-L on CLI
bindkey "^L" fzf-tab-complete


### SHELL-EDITOR
### Usage: C-X C-E on CLI
editor-command-line () {
    local VISUAL='emacsclient -nw --alternate-editor=""'
    # local VISUAL='vim'

    edit-command-line
}
autoload -Uz   edit-command-line
zle -N         editor-command-line
bindkey '^X^E' editor-command-line


### DELETE ??
bindkey  "^[[3~" delete-char
################################################################################### END KEYBINDINGS
