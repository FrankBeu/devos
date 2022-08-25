{ inputs }:

final: prev:
{
  ### KEEP SOURCES FIRST,
  ### SOURCES-OVERLAY FROM NVFETCHER
  sources               =  prev.callPackage (import ./_sources/generated.nix)  {};


  ### THEN, CALL PACKAGES WITH `FINAL.CALLPACKAGE`
  ### LOCALLY DEFINED PACKAGES
  i3statusBar           = final.callPackage         ./i3statusBar              {};
  shellColorDefinitions = final.callPackage         ./shellColorDefinitions    {};
  revealjs              = final.callPackage         ./revealjs                 {};
  riv                   = final.callPackage         ./riv                      {};

  ### k8s
  kubectl-cert-manager  = final.callPackage         ./k8s/kubectl/plugins/cert-manager {};
  kubectl-neat          = final.callPackage         ./k8s/kubectl/plugins/neat         {};
  crd2pulumi            = final.callPackage         ./k8s/pulumi/crd2pulumi            {};
  kube2pulumi           = final.callPackage         ./k8s/pulumi/kube2pulumi           {};

  ### TEMPORARILY
  starship              = final.callPackage         ./starship                         {};


  ### PACKAGES PROVIDED BY FLAKES
  inherit (inputs.rnix-lsp.packages."${prev.system}") rnix-lsp;
}
