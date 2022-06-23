###
##
# ** LIST-ALIASES
#
SD=${0:h} ### ScriptDirectory `mans ' Modifiers' zshexpn`


alias alal=' alias | rg -pN "rg.* \| less"             | less'  ### allalias
alias bgal=' alias | rg -pN borg                       | less'  ### borg
alias cdal=' alias | rg -pN cd                         | less'  ### cd
alias dal='  alias | rg -pN docker                     | less'  ### docker
alias exal=' cat ${SD}/exa.zsh                               '  ### exa
alias faal=' alias | rg -pN attr                       | less'  ### fileAttributes
alias gal='  alias | rg -pN git                        | less'  ### git
alias gpal=' alias | rg -pN gopass                     | less'  ### gopass
alias hal='  alias | rg -pN "home-manager|home-config" | less'  ### homemanager
alias kal='  alias | rg -pN kubectl                    | less'  ### kubectl
alias mkal=' alias | rg -pN minikube                   | less'  ### minikube
alias sysal='alias | rg -pN systemctl                  | less'  ### systemctl
alias xal='  alias | rg -pN xrandr                     | less'  ### xrandr
