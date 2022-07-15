{config, pkgs, ...}:
{
  programs.zsh = {
      ### ⓪
      ### TODO: needs homemanager-update
      # initExtraFirst = ''
      # zmodload zsh/zprof ### profile; USAGE: zprof
      # '';


      ### ①
      ### typeset -U path cdpath fpath manpath

      ### ②
      # cdpath = [];


      ### ③
      ### for profile ...
      ### HELPDIR ...


      ### ④
      defaultKeymap = "emacs";


      ### ⑤
      # localVariables = { POWERLEVEL9K_LEFT_PROMPT_ELEMENTS = [ "dir" "vcs" ] ; };


      ### ⑥
      initExtraBeforeCompInit = ''
      ${(builtins.readFile ./preCompletion.zsh)}
      '';


      ### ⑦
      ### plugins: add to path and fpath

      ### ⑧
      enableCompletion = false;


      ### ⑨
      enableAutosuggestions = false;


      ### ⑩
      ### . "/home/<USER>/.nix-profile/etc/profile.d/hm-session-vars.sh"
      ### ⑪
      # sessionVariables = { MAILCHECK = 30; };


      ### ⑫
      ### oh-my-zsh
      ### prezto


      ### ⑬
      ### source Plugins


      ### ⑭
      history = {
        expireDuplicatesFirst = true;
        extended    = true;
        ignoreDups  = true;
        ignoreSpace = true;
        path        = "${config.xdg.dataHome}/zsh/zsh_history"; ### needs hmState ≥ 20.03
        save        = 500000;
        share       = true;
        size        = 500000;
      };


      ### ⑮
      autocd = true;


      ### ⑯
      initExtra = ''
      ###################################################################################### compinit
      ###
      ##
      #
      autoload -Uz compinit && zsh-defer compinit

      ### complete aliases, too: needs 'compdef <ALIAS>=<COMPLETION>' for each alias
      setopt complete_aliases
      ######################################################################### END compinit

      ###################################################################################### completion
      ###
      ##
      #
      autoload -U +X bashcompinit && zsh-defer bashcompinit
      zsh-defer complete -o nospace -C tk tk
      ######################################################################### END completion

      ###################################################################################### zshrc.d
      ###
      ##
      #
      for file in ~/.config/zsh/zshrc.d/*.zsh
      do
        zsh-defer source "''${file}"
      done
      ########################################################################## END zshrc.d

      ###################################################################################### aliasesVolatile
      ###
      ##
      #
      if [ -f $XDG_CONFIG_HOME/zsh/volatiles/aliases ]; then
        source $XDG_CONFIG_HOME/zsh/volatiles/aliases
      fi
      ########################################################################## END zshrc.d
      '';

      ### ⑰
      ### TODO: only available in homemanager: bind to termite
      enableVteIntegration = true;

      ### ⑱
      ### shellAliases = {
      ###   a = "source ~/MYZSH";
      ###   ".." = "cd ..";
      ### };


      ### ⑲
      shellGlobalAliases = import ./globalAliases.nix;


      ### ⑳
      ### cd-shortcuts
      ### creates `hash -d C="$HOME/.config"`  useable with `~C`
      ### dirHashes = {
      ###   C = "$HOME/.config";
      ### };


      ### ㉑
      ### oh-my-zsh-cache

      ### ㉒
      ### compinit if plugins != []
      };
}
