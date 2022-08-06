### only CONFIGURATION - cf. ../../../../nixos/profiles/editor/emacs/default.nix:1:24
{ config, inputs, variables, ... }:
let
  inherit (config.home) username;
in
{
  home.file = {
    ".emacs.d/init.el"      .source = "${inputs.emacsFlake.outputs.emacsConfig}/init.el";
    ".emacs.d/ASSETS"       .source = "${inputs.emacsFlake.outputs.emacsConfig}/ASSETS";
    ".emacs.d/themes/themes".source = "${inputs.emacsFlake.outputs.emacsConfig}/themes/themes";
    ".emacs.d/snippets"     .source = "${inputs.emacsFlake.outputs.emacsConfig}/snippets";

    ".emacs.d/languages/golang/config.el".source = "${inputs.emacsFlake.outputs.emacsConfig}/languages/golang/config.el";
    ".emacs.d/languages/golang/funcs.el" .source = "${inputs.emacsFlake.outputs.emacsConfig}/languages/golang/funcs.el";
    ".emacs.d/orgmode/revealjs"          .source = "${inputs.emacsFlake.outputs.emacsConfig}/orgmode/revealjs";

    ".emacs.d/global/packages-local/core-funcs.el"          .source = "${inputs.emacsFlake.outputs.localPackages}/core-funcs.el";
    ".emacs.d/global/packages-local/core-toggle.el"         .source = "${inputs.emacsFlake.outputs.localPackages}/core-toggle.el";
    ".emacs.d/global/packages-local/core-transient-state.el".source = "${inputs.emacsFlake.outputs.localPackages}/core-transient-state.el";
    ".emacs.d/global/packages-local/dart-snippets.el"       .source = "${inputs.emacsFlake.outputs.localPackages}/dart-snippets/dart-snippets.el";   ### https://github.com/Davoodeh/dart-snippets
    ".emacs.d/global/packages-local/ox-ipynb.el"            .source = "${inputs.emacsFlake.outputs.localPackages}/ox-ipynb/ox-ipynb.el";
    ".emacs.d/global/packages-local/snippets/dart-mode"     .source = "${inputs.emacsFlake.outputs.localPackages}/dart-snippets/snippets/dart-mode";
    ".emacs.d/global/packages-local/tridactyl-mode.el"      .source = "${inputs.emacsFlake.outputs.localPackages}/tridactyl-mode.el";

    ### DOC
    ".docLocal/content/homemanager/emacs.org".source = inputs.emacsFlake.outputs.emacsDocumentation;
  };

  systemd.user.tmpfiles.rules = [
    "D /home/${username}/.emacs.d/.local                           - - - - "
    "D /home/${username}/.emacs.d/BAK                              - - - - "
    "D /home/${username}/.emacs.d/.state/config/yasnippet/snippets - - - - "
  ];
}


### TODO: extract core, ... to lib/
# ".emacs.d/lib".source = "${inputs.emacsFlake.outputs.emacsConfig}/lib";
### TODO create mechanism to use packages/... not available via emacs-overlay
### TODO: split configuration (used via init.el) and required functions
###       config / lib/*
# "D /home/${username}/.emacs.d/OUTPUT - - - - "
