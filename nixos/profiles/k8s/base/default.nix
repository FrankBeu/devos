{ config, pkgs, ...}:
{
  environment = {
    ### packages for k8s administrative tasks
    systemPackages = with pkgs; [

      kompose
      kubecolor
      kubectx
      kubernetes-helm

      starboard           ### https://github.com/aquasecurity/starboard

      kubectl
      ###
      ### PLUGINS
      ### https://github.com/ishantanu/awesome-kubectl-plugins
      ### NeverEver use a plugin manager: e.g. krew
      kubectl-cert-manager
      kubectl-doctor
      kubectl-example
      kubectl-neat
      kubectl-tree
    ];

    etc."/docLocal/content/system/k8s.org".source = ./doc.org;


    ### TODO use kaliases to generate and configure aliases automatically
    ### currently the list ist generated manually by executing `go run ./mykaliases.go > aliases.nix`
    shellAliases = {
      ### TODO check if aliases are sufficient
      ### kubectl = ''kubecolor'' ;
      ktx     = ''kubectx''                   ;
      kns     = ''kubens''                    ;

      kci     = ''kubectl cluster-info''      ;
      kcid    = ''kubectl cluster-info dump'' ;

      kgimguc = ''kubectl get pods --all-namespaces -o jsonpath="{..image}" | tr -s '[[:space:]]' '\n' | sort | uniq --count'';### KubectlGetIMaGesUsedClusterwide
      kgnstl  = ''kubectl get ns -o jsonpath='{range .items[*]}{..tier}{"\n"}{end}' | sort -u''                               ;### KubectlGetNameSpacesTierLabels
    }                                                //
    (import ./aliases/generated_kubectl_aliases.nix) //
    (import ./aliases/generated_kbcolor_aliases.nix) //
    {};
  };
}
