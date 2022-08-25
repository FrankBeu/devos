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
      ### NeverEver use a plugin manager: krew
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
      ktx  = ''kubectx''                   ;
      kns  = ''kubens''                    ;

      kci  = ''kubectl cluster-info''      ;
      kcid = ''kubectl cluster-info dump'' ;
      # kcid = ''kubectl cluster-info dump lpj'' ;
    }                                                //
    (import ./aliases/generated_kubectl_aliases.nix) //
    (import ./aliases/generated_kbcolor_aliases.nix) //
    {};
  };

  ### TODO
  # programs.zsh.initExtra = ''
  #   compdef kubecolor=kubectl
  # '';

  # global
  # g coya=" | yq . -y |cat -plyaml";
}
