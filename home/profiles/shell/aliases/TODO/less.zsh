###
##
# * LESS-ALIASES
#


###
##
# ** lessColorized
#
# alias lc='LESS="-R" LESSOPEN="|pygmentize -g %s" less'
alias lc='LESS="-R" LESSOPEN="|pygmentize -g %s" less'
alias -g lcc=" | ccze -A| less"



###
##
# ** lessThePrevious
#
alias -g l='$(fc -ln -1) | less'


###
##
# ** lessPipe{,JSON}
#
alias -g lp=" | less"
alias -g lpj=" | jq -C | less"


###
##
# ** colorize
#
alias c="ccze -A"

###############################################################
### Destroys {kubectl,pulumi}-completion
### TODO: why???
###############################################################
###
##
# ** colorize
#
#alias -g c=" | ccze -A"
