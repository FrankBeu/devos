###
##
# * k8s
#


###
##
# ** ahmetb/kubectl-aliases
#
source /run/current-system/sw/share/kaliases/.kubectl_aliases


###
##
# ** kubecolor
#
alias kubectl="kubecolor"
compdef kubecolor=kubectl


###
##
# ** kube
#
alias ktx='kubectx'
alias kns='kubens'


###
##
# *** kubectl
#
alias kci='kubectl cluster-info'
alias kcid='kubectl cluster-info dump lpj'


###
##
# ** minikube-aliases
#
alias mk='   minikube'
alias mkst=' minikube start --insecure-registry=registry.git.lcl'
alias mkstp='minikube stop'
alias mkdel='minikube delete'
alias mkdb=' minikube dashboard'
alias mksvc='minikube service'
alias mkip=' minikube ip'


###
##
# ** tasks
#
# *** K8sResourcesNamespacedGet
alias krng='task -t /home/frank/k3s/Taskfile.yml resourcesNamespacedGet'


###
##
# ** misc
#
# *** COlorizeYAml
#
alias -g coya=" | yq . -y |cat -plyaml"
#
# *** k8sQueryGetResourcesNamespaced
#
alias kqgrn="k8sQueryGetResourcesNamespaced"

