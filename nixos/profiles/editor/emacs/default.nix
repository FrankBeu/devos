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

  ### doc.local/system/emacs/
  environment.etc."/docLocal/content/system/emacs.org".source = ./emacs.org;
}
