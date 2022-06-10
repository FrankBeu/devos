{ self, inputs, ... }:
{
  modules = with inputs; [
    bud.devshellModules.bud
  ];
  exportedModules = [
    ./devos.nix
  ];
}
### TODO check ~/KEEPNOT/devoses/SOPS/knopki/devops-at-home/flake.nix:224:11
