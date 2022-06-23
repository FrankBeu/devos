{config, pkgs, variables, ...}:
let
  inherit (config.home) username;
  zshenv = {
      ### IPs
      ###
      # IP_KUBE_HOST = "export IP_KUBE_HOST='${variables.ipKubeHost}'";
      # IP_MAC       = "export IP_MAC='${variables.ipMac}'";

      ### FLUTTER
      ###
      CHROME_EXECUTABLE = "export CHROME_EXECUTABLE=/usr/bin/chromium";

      KUBE_EDITOR    = "export KUBE_EDITOR='emacsclient -c -a \"\"'";

      ### gpg / sops
      ###
      GPG_TTY = "export GPG_TTY=$(tty)";

      ### K8S
      ###
      ### MINIKUBE
      ###
      MINIKUBE_IN_STYLE = "export MINIKUBE_IN_STYLE=1";

      ### ranger needs:
      ###
      LC_CTYPE = "export LC_CTYPE='en_US.UTF-8'";


      ### summon
      ###
      SUMMON_PROVIDER = "export SUMMON_PROVIDER=$DOT_LOCAL_BIN/summonGopassProvider";

      ### Fix for emacs-TRAMP
      ###
      TRAMP_FIX = "[ $TERM = \"dumb\" ] && unsetopt zle && PS1='$ '";

      ### XDG-ENVS
      ###
      ### GnuPG
      XDG_GPG = "export GNUPGHOME=\"$XDG_DATA_HOME\"/gnupg";

      ### GTK
      XDG_GTK1 = "export GTK_RC_FILES=\"$XDG_CONFIG_HOME\"/gtk-1.0/gtkrc";
      XDG_GTK2 = "export GTK2_RC_FILES=\"$XDG_CONFIG_HOME\"/gtk-2.0/gtkrc";

      ### MySQL
      XDG_MYSQL = "export MYSQL_HISTFILE=\"$XDG_CACHE_HOME\"/mysql_history";

      ### ripgrep
      XDG_RG = "export RIPGREP_CONFIG_PATH=\"$XDG_CONFIG_HOME\"/ripgrep/config";

      ### rust
      XDG_CARGO = "export CARGO_HOME=\"$XDG_DATA_HOME\"/cargo";
      XDG_RUSTUP = "export RUSTUP_HOME=\"$XDG_DATA_HOME\"/rustup";

      ### sqlite
      XDG_SQLITE = "export SQLITE_HISTORY=\"$XDG_CACHE_HOME\"/sqlite_history";
    };
in {
  programs.zsh.envExtra =
    ''
    # ${zshenv.IP_MAC}

    ${zshenv.LC_CTYPE}
    ${zshenv.KUBE_EDITOR}

    # ${zshenv.GPG_TTY}
    ${zshenv.SUMMON_PROVIDER}

    ${zshenv.LESSKEY}
    ${zshenv.LESSHISTFILE}
    ${zshenv.MINIKUBE_IN_STYLE}
    # ${zshenv.CHROME_EXECUTABLE}
    ${zshenv.TRAMP_FIX}

    # ${zshenv.XDG_GPG}
    # ${zshenv.XDG_GTK1}
    # ${zshenv.XDG_GTK2}
    # ${zshenv.XDG_MYSQL}
    ${zshenv.XDG_RG}
    # ${zshenv.XDG_CARGO}
    # ${zshenv.XDG_RUSTUP}
    # ${zshenv.XDG_SQLITE}
    '';

    # ${zshenv.IP_KUBE_HOST}

  ### INFO
  ### add to path "path+=(\"$HOME/.local/bin\")";


}
