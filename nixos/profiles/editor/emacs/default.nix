### SERVICE, ... - cf. ../../../../home/profiles/editor/emacs/default.nix:1:30
{ inputs, pkgs, ... }:
let
  emacsAliases        = inputs.emacsFlake.outputs.aliases;
  emacsSystemPackages = inputs.emacsFlake.outputs.systemPackages;
  emacsPackage        = inputs.emacsFlake.outputs.emacsPackage;
in
{
  imports = [
    emacsSystemPackages
    emacsAliases
  ];

  environment.systemPackages = [
    emacsPackage
  ];

  services.emacs = {
    enable        = true;
    defaultEditor = true;
    package       = emacsPackage;
  };
}
