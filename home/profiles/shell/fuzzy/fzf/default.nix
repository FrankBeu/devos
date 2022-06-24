{config, pkgs,  variables, ...}:
# let colors = (import ./themes/${variables.currentThemeName}.nix { inherit variables }).colors
let colors = (import ./themes/default.nix { inherit variables; }).colors;
in
{
  programs = {

    pet.selectcmdPackage = pkgs.fzf;

    fzf = {
      enable               = true;
      enableZshIntegration = true;

      changeDirWidgetCommand = "fd --type d";
      changeDirWidgetOptions = with colors; [
        "--preview 'exa -TR | head -200'"
        "--color=dark"
        "--color=fg:${fg},bg:${bg},preview-fg:${preview-fg},preview-bg:${preview-bg},hl:${hl},fg+:${fgPlus}"
        "--color=bg+:${bgPlus},gutter:${gutter},hl+:${hlPlus},query:${query},disabled:${disabled},info:${info}"
        "--color=prompt:${prompt},pointer:${pointer},marker:${marker},spinner:${spinner},header:${header}"
      ];
        # "--preview 'tree -C {} | head -200'"

      defaultCommand = "fd --type f";
      defaultOptions = with colors; [
        "--height 40%"
        "--border"
        "--bind" "ctrl-j:backward-delete-char/eof,ctrl-k:up,ctrl-l:down,alt-k:preview-up,alt-l:preview-down"
        "--color=dark"
        "--color=fg:${fg},bg:${bg},preview-fg:${preview-fg},preview-bg:${preview-bg},hl:${hl},fg+:${fgPlus}"
        "--color=bg+:${bgPlus},gutter:${gutter},hl+:${hlPlus},query:${query},disabled:${disabled},info:${info}"
        "--color=prompt:${prompt},pointer:${pointer},marker:${marker},spinner:${spinner},header:${header}"
        "--preview-window right,60%"
      ];

      fileWidgetCommand = "fd --type f";
      fileWidgetOptions = with colors; [
        "--preview 'bat --color=always --style=changes {}'"
        "--color=fg:${fg},bg:${bg},preview-fg:${preview-fg},preview-bg:${preview-bg},hl:${hl},fg+:${fgPlus}"
        "--color=bg+:${bgPlus},gutter:${gutter},hl+:${hlPlus},query:${query},disabled:${disabled},info:${info}"
        "--color=prompt:${prompt},pointer:${pointer},marker:${marker},spinner:${spinner},header:${header}"
      ];

      historyWidgetOptions = with colors; [
        "--preview" "'echo {}'"
        "--preview-window" "down:3:hidden:wrap"
        "--bind" "'?:toggle-preview'"
        "--color=fg:${fg},bg:${bg},preview-fg:${preview-fg},preview-bg:${preview-bg},hl:${hl},fg+:${fgPlus}"
        "--color=bg+:${bgPlus},gutter:${gutter},hl+:${hlPlus},query:${query},disabled:${disabled},info:${info}"
        "--color=prompt:${prompt},pointer:${pointer},marker:${marker},spinner:${spinner},header:${header}"
      ];
      # "--sort" "--exact"                       ### sort alpha instead of time
    };


    ### TODO extract keybindings unrelated to fzf
    zsh = {
      initExtra = ''
        fzf-history-widget-accept() {
          fzf-history-widget
          zle accept-line
        }
        zle     -N     fzf-history-widget-accept
        bindkey '^X^R' fzf-history-widget-accept
        bindkey '^[T'  transpose-words
        bindkey '^[t'  transpose-chars
        bindkey '^[L'  clear-screen
      '';
    };
  };

  ### DOC
  home.file.".docLocal/content/homemanager/shell.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ** fuzzyfinder
    *** fzf
        https://github.com/junegunn/fzf
    **** configuration
    ***** keybindings
          #+begin_src shell
            mans KEY/EVENT BINDINGS fzf
          #+end_src
  '');
}
### TODO https://github.com/sharkdp/bat#fzf
### TODO DOC
### showkey -a
### man zshzle
### CTRL-v
### show all bindings: `bindkey`
### show one bindings: `bindkey` CTRL-v KEY
### ALT and ALT-SHIFT are different
### CTL and CTL-SHIFT are identical
