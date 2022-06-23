###
##
# * ALIASES
#

###
##
# ** path to alias-directory
#
P2AD=${0:h}/aliases


###
##
# ** source alias-files
#
for file in ${P2AD}/*.zsh
do
  source "${file}"
done
