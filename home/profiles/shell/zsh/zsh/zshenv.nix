### TODO dissolve - use sessionVariables instead
{config, pkgs, variables, ...}:
let
  inherit (config.home) username;
  zshenv = {
      ### ENVIRONMENT
      ### XDG
      ### BE CAREFUL: HM-managed XDG-vars (xdg.enable = true;) are only available after zshrc
      ### cf. ../../../xdg/default.nix:12
      ###
      XDG_CACHE_HOME  = "export XDG_CACHE_HOME=\"$HOME\"/.cache";
      XDG_CONFIG_HOME = "export XDG_CONFIG_HOME=\"$HOME\"/.config";
      XDG_DATA_HOME   = "export XDG_DATA_HOME=\"$HOME\"/.local/share";
      XDG_STATE_HOME  = "export XDG_STATE_HOME=\"$HOME\"/.local/state";

      ### Volatiles
      ### NOT managed by nix or hm
      ###
      VOLATILES  = ''
        if [ -f $XDG_CONFIG_HOME/zsh/volatiles/.zshenvVolatile ]; then
          source $XDG_CONFIG_HOME/zsh/volatiles/.zshenvVolatile
        fi'';

      ### BROWSER
      ###
      BROWSER = "export BROWSER='${variables.users.${username}.defaultBrowser}'";


      ### EDITOR
      ### TODO: use emacsclient in terminal as EDITOR
      ###       not working for `gopass edit test`
      ###       cf. keybindings are set in /etc/nixos/config/users/config/homemanager/cli/default.nix
      # EDITOR         = "export EDITOR='emacsclient -tc --alternate-editor =\"\"'";
      # EDITOR         = "export EDITOR='emacsclient -t --alternate-editor =\"\"'";

      EDITOR         = "export EDITOR='vim'";
      VISUAL         = "export VISUAL='emacsclient -nc --alternate-editor =\"\"'";

      SYSTEMD_EDITOR = "export SYSTEMD_EDITOR='emacsclient -c -a \"\"'";

      ### MUST NOT BE SET: (prevents globally defined aliases from being loaded)
      ### Do NOT load global zshRunCommands
      ### NO_GLOBAL_RCS = "setopt no_global_rcs";
    };
in {
  programs.zsh.envExtra =
    ''
    ${zshenv.XDG_CACHE_HOME}
    ${zshenv.XDG_CONFIG_HOME}
    ${zshenv.XDG_DATA_HOME}
    ${zshenv.XDG_STATE_HOME}

    ${zshenv.VOLATILES}

    ${zshenv.BROWSER}
    ${zshenv.EDITOR}
    ${zshenv.VISUAL}
    ${zshenv.SYSTEMD_EDITOR}

    '';
    # $${zshenv.NO_GLOBAL_RCS}

  ### INFO
  ### add to path "path+=(\"$HOME/.local/bin\")";

}
