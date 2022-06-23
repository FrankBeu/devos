###
## * clipboard
#


###
## ** selection
#
alias s1='xsel -p'
alias s2='xsel -s'
alias s3='xsel -b'
alias sc='xsel -pc; xsel -sc; xsel -bc'

###
## ** fromTo
#
alias 1-3='s1 | s3 '
alias 2-3='s2 | s3 '
alias 1-2='s1 | s2 '
alias 2-1='s2 | s1 '
alias 3-1='s3 | s1 '
alias 3-2='s3 | s2 '

###
## ** into
#
alias -g t1=" | s1"
alias -g t2=" | s2"
alias -g t3=" | s3"
