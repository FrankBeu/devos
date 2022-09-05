{config, pkgs,  ...}:
let petKeybinding = rec {
      char = "s";
      zsh  = "^${char}";
      doc  = "C-${char}";
    };
in {
  programs = {
    pet = {
      enable = true;
      ### selectcmdPackage; in fzf and skim
      settings = {};
      snippets = [  ### sorted by description, reversed; keep whitespace for indentation

        {
          command     = "zsh -dfi";
          description = "zsh:      without any configuration loaded      ";
          output      = "zsh";
        }
        {
          command     = "xset r rate 145 225";
          description = "xset:     set cursor-speed                      ";
          output      = "none";
        }
        {
          command     = "youtube-dl --rm-cache-dir";
          description = "ydl:      remove cache after HTTP Error 403     ";
          output      = "none";
        }
        {
          command     = "vim '+call cursor(LINE, COLUMN) FILENAME'";
          description = "vim:      Open file with cursor at position     ";
          output      = "editor";
        }
        {
          command     = "VBoxManage controlvm Kali-Linux-2020.4-vbox-amd64 pause";
          description = "vbox:     Kali pause                            ";
          output      = "stopped machine";
        }
        {
          command     = "VBoxManage controlvm Kali-Linux-2020.4-vbox-amd64 resume";
          description = "vbox:     Kali resume                           ";
          output      = "resumed machine";
        }
        {
          command     = "systemd-analyze calendar --iterations=10 '*-*-* *:*:00'";
          description = "systemd:  check if calendar is valid            ";
          output      = "list of dates";
        }
        {
          command     = "sudo ssh-keygen -lf /etc/ssh/ssh_host_ed25519_key.pub";
          description = "ssh:      get key fingerprint                   ";
          output      = "SHA256";
        }
        {
          command     = "ssh-keygen -R 192.168.0.17";
          description = "ssh:      remove host from known-hosts          ";
          output      = "message";
        }
        {
          command     = "rsync -raP ./FILENAME USERNAME@192.168.0.31:/home/frank/MEDIA/EXTERN/FILENAME";
          description = "rsync:    sync file to machine                  ";
          output      = "log";
        }
        {
          command     = "rg PATTERN -g '!PATH/SEGMENT/SEGMENT' -g '!PATH'";
          description = "rg:       exclude multiple paths                ";
          output      = "match";
        }
        {
          command     = "rg -IN 'PATTERN'";
          description = "rg:       show only match (no line,filename)    ";
          output      = "match";
        }
        {
          command     = "rg -U -B10 -A15 'PATTERN1.*\\n(?s).*PATTERN2'";
          description = "rg:       multiline                             ";
          output      = "match";
        }
        {
          command     = "qpdf --empty --pages INPUT.pdf 5-z -- OUTPUT.pdf";
          description = "qpdf:     extract pages (z = lit.: last page)   ";
          output      = "pdf";
        }
        {
          command     = "nmap -PS22 '192.168.0.*'";
          description = "nmap:     scan network for ssh                  ";
          output      = "info";
        }
        {
          command     = "mogrify -rotate -90 FILENAME";
          description = "mogrify:  rotate image                          ";
          output      = "rotated image";
        }
        {
          command     = "mans '^CONDITIONAL EXPRESSIONS' zshmisc";
          description = "man:      zsh tests, [[, ...                    ";
          output      = "manPage";
        }
        {
          command     = "man zshexpn";
          description = "man:      zsh expansion, parameter, ...         ";
          output      = "manPage";
        }
        {
          command     = "hugo serve -s /etc/nixos/doc";
          description = "nixos:    serve nixosDocumentation              ";
          output      = "localhost:1313";
        }
        {
          command     = "nix-prefetch-url --unpack ";
          description = "nixos:    get hash of specified URL             ";
          output      = "path + hash";
        }
        {
          command     = "img2pdf --rotation=ifvalid FILENAME.jpg -o FILENAME.pdf";
          description = "img2pdf:  convert to pdf even if rot is invalid ";
          output      = "match";
        }
        {
          command     = "GOPASS_DEBUG_LOG=~/TMP/gopass.log gopass";
          description = "gopass:   Run with logfile                      ";
          output      = "log";
        }
        {
          command     = "git rev-list --count HEAD";
          description = "git:      Count commits in the current branch   ";
          output      = "int";
        }
        {
          command     = "e +4:4 FILENAME";
          description = "emacs:    Open file with cursor at position     ";
          output      = "window";
        }
        {
          command     = "dig TXT +short o-o.myaddr.l.google.com @ns1.google.com";
          description = "dig:      get external ip                       ";
          output      = "IP";
        }
        {
          command     = "date -d @370501620 '+%FT%T'";
          description = "date:     conversion timestamp - fullDateTime   ";
          output      = "fullDateTime";
        }
        {
          command     = "date -d '1981-09-28T06:07:00' '+%s'";
          description = "date:     conversion fullDateTime - timestamp   ";
          output      = "timestamp";
        }
        # {
        #   command     = "";
        #   description = "COMMAND:    DESC                                  ";
        #   output      = "";
        # }
      ];
    };

    zsh = {
      initExtra = ''
      function pet-select() {
        BUFFER=$(pet search --query "$LBUFFER")
        CURSOR=$#BUFFER
        zle redisplay
      }
      zle -N pet-select
      stty -ixon
      bindkey '${petKeybinding.zsh}' pet-select
      '';
    };
  };

  ### DOC
  home.file.".docLocal/content/homemanager/shell.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter ''
    ** snippets
    *** pet
        https://github.com/knqyf263/pet
    **** USAGE
          =${petKeybinding.doc}=
  '');
}
