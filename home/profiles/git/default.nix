{ nixosConfig, config, variables, ... }:
let
  inherit (config.home) username;
  userDescription = nixosConfig.users.users.${username}.description;
  userEmail       = variables.users.${username}.email;
in
{
  home.shellAliases = {
    gswls = ''git ls-files -v | grep "^S"''       ;### SkipWorktree LS
  };

  programs.git = {

    attributes = [
      "*.html diff"
      "*.java diff"
      "*.js   diff"
      "*.pl   diff"
      "*.sh   diff"
      "*.ts   diff"
      "*.txt  diff"
      "*.xml  diff"
      "*.zsh  diff"
    ];

    aliases = {
      a     = "add -p";
      al    = "config --get-regexp '^alias\.'"     ;### ALiases
      ad    = "add ."                              ;### Add Dot
      bD    = "branch -D";
      ba    = "branch -a";
      bd    = "branch -d";
      c     = "commit";
      cl    = "clone";
      co    = "checkout";
      cob   = "checkout -b";
      d     = "diff";
      dc    = "diff --cached";
      ds    = "diff --staged";
      desc  = ''describe''                     ;### Describe (distance to last tag
      descl = ''describe --tag''               ;### Describe Lightweight (unannotated tags)
      f     = "fetch -p";
      i     = "init";
      ### swls                                ;### SkipWorktree LS -> check home.shellAliases
      swa   = "update-index --skip-worktree "  ;### SkipWorktree Add    <FILE>
      swr   = "update-index --no-skip-worktree";### SkipWorktree Remove <FILE>
      p     = "push";
      r     = "restore";
      ro    = "remote get-url origin"              ;### Remote Origin
      rg    = "remote get-url github"              ;### Remote Github
      rs    = "restore --staged";
      st    = "status -sb";


      ### reset
      soft  = "reset --soft";
      hard  = "reset --hard";
      s1ft  = "soft HEAD~1";
      h1rd  = "hard HEAD~1";


      ### logging (!external command)
      lgc   = "shortlog -sn --no-merges"                                                                ;### LoG Count
      lgy   = "log --graph --date=relative --abbrev-commit --pretty=oneline --stat --since='1 Day Ago'" ;### LoG since Yesterday

      lgs   = "log --format=short"                    ;### LoG Short
      lgm   = "log --format=medium"                   ;### LoG Medium
      lgf   = "log --format=full"                     ;### LoG Full
      lgfr  = "log --format=fuller"                   ;### LoG FulleR
      lgr   = "log --format=reference"                ;### LoG Reference
      lgw   = "log --format=raw"                      ;### LoG Raw

      ### ALL
      ### SINGLE-LINE
      ### LoG SingleFull
      ### hash author email date dateRelative sigStatus sigName sigFinger subject refName
      lgsf  = "log --graph --pretty=format:'%C(red)%h %<(20)%C(cyan)%aI %C(green)%ar %<(50)%C(magenta)%aE %<(20)%C(blue)%aN %C(yellow)%G? %<(20)%C(blue)%GS %<(47)%C(magenta)%GF %<(100)%C(yellow)%s %<(45)%C(brightred)%D %C(reset)'";
      ### LoG SingleLong
      ### hash author email date dateRelative subject refName
      lgsl  = "log --graph --pretty=format:'%C(red)%h %<(20)%C(cyan)%aI %C(green)%ar %<(20)%C(blue)%aN %<(50)%C(magenta)%aE %<(100)%C(yellow)%s %<(45)%C(brightred)%D %C(reset)'";
      ### LoG SingleShort
      ### hash dateRelative author subject refName
      lgss  = "log --graph --pretty=format:'%C(red)%h %C(green)%ar %<(20)%C(blue)%aN %<(100)%C(yellow)%s %<(45)%C(brightred)%D %C(reset)'";
      ### MULTI-LINE
      ### LoG MultiFull
      ### hash author email date dateRelative sigStatus sigName sigFinger refName /n subject /n body /n notes
      lgmf  = "log --pretty=format:'%C(red)%h %<(20)%C(cyan)%aI %C(green)%ar %C(blue)%aN %C(magenta)%aE %C(yellow)%G? %<(20)%C(blue)%GS %<(47)%C(magenta)%GF %<(45)%C(brightred)%D%n%n%w(108,2,2)%C(yellow)%s%n%n%w(72,4,4)%C(reset)%b%n%C(cyan)%N%C(reset)%n%n'";
      ### LoG MultiLong
      ### hash author email date dateRelative refName /n subject /n body /n notes
      lgml  = "log --pretty=format:'%C(red)%h %<(20)%C(cyan)%aI %C(green)%ar %C(blue)%aN %C(magenta)%aE %<(45)%C(brightred)%D%n%n%w(108,2,2)%C(yellow)%s%n%n%w(72,4,4)%C(reset)%b%n%C(cyan)%N%C(reset)%n%n'";
      ### LoG MultiShort
      ### hash dateRelative author refName /n subject /n body /notes
      lgms  = "log --pretty=format:'%C(red)%h %C(green)%ar %C(blue)%aN %C(brightred)%D%n%n%w(108,2,2)%C(yellow)%s%n%n%w(72,4,4)%C(reset)%b%n%C(cyan)%N%C(reset)%n%n'";


      ### ONE
      ### SINGLE-LINE
      ### LoG SingleFull
      lgsf1 = "log -1 --pretty=format:'%C(red)%h %C(cyan)%aI %C(green)%ar %C(blue)%aN %C(magenta)%aE %C(yellow)%G? %C(blue)%GS %C(magenta)%GF%n%C(yellow)%s %C(brightred)%D %C(reset)'";
      ### LoG SingleLong
      lgsl1 = "log -1 --pretty=format:'%C(red)%h %C(cyan)%aI %C(green)%ar %C(blue)%aN %C(magenta)%aE%n%C(yellow)%s %C(brightred)%D %C(reset)'";
      ### LoG SingleShort
      lgss1 = "log -1 --pretty=format:'%C(red)%h %C(green)%ar %C(blue)%aN%n%C(yellow)%s %C(brightred)%D %C(reset)'";
      ### MULTI-LINE
      ### LoG MultiFull
      lgmf1 = "log --pretty=format:'%C(red)%h %C(cyan)%aI %C(green)%ar %C(blue)%aN %C(magenta)%aE %C(yellow)%G? %C(blue)%GS %C(magenta)%GF %C(brightred)%D%n%n%w(108,2,2)%C(yellow)%s%n%n%w(72,4,4)%C(reset)%b%n%C(cyan)%N%C(reset)%n%n' -1";
      ### LoG MultiLong
      lgml1 = "log --pretty=format:'%C(red)%h %C(cyan)%aI %C(green)%ar %C(blue)%aN %C(magenta)%aE %C(brightred)%D%n%n%w(108,2,2)%C(yellow)%s%n%n%w(72,4,4)%C(reset)%b%n%C(cyan)%N%C(reset)%n%n' -1";
      ### LoG MultiShort
      lgms1 = "log --pretty=format:'%C(red)%h %C(green)%ar %C(blue)%aN %C(brightred)%D%n%n%w(108,2,2)%C(yellow)%s%n%n%w(72,4,4)%C(reset)%b%n%C(cyan)%N%C(reset)%n%n' -1";


      ### TEN
      ### SINGLE-LINE
      ### LoG SingleFull10
      lgsf0  = "log -10 --graph --pretty=format:'%C(red)%h %<(20)%C(cyan)%aI %C(green)%ar %<(50)%C(magenta)%aE %<(20)%C(blue)%aN %C(yellow)%G? %<(20)%C(blue)%GS %<(47)%C(magenta)%GF %<(100)%C(yellow)%s %<(50)%C(magenta)%aE %<(45)%C(brightred)%D %C(reset)'";
      ### LoG SingleLong10
      lgsl0  = "log -10 --graph --pretty=format:'%C(red)%h %<(20)%C(cyan)%aI %C(green)%ar %<(20)%C(blue)%aN %<(50)%C(magenta)%aE %<(100)%C(yellow)%s %<(45)%C(brightred)%D %C(reset)'";
      ### LoG SingleShort10
      lgss0  = "log -10 --graph --pretty=format:'%C(red)%h %C(green)%ar %<(20)%C(blue)%aN %<(100)%C(yellow)%s %<(45)%C(brightred)%D %C(reset)'";
      ### MULTI-LINE
      ### LoG MultiFull
      lgmf0 = "log -10 --pretty=format:'%C(red)%h %C(cyan)%aI %C(green)%ar %C(blue)%aN %C(magenta)%aE %C(yellow)%G? %C(blue)%GS %C(magenta)%GF %C(brightred)%D%n%n%w(108,2,2)%C(yellow)%s%n%n%w(72,4,4)%C(reset)%b%n%C(cyan)%N%C(reset)%n%n'";
      ### LoG MultiLong
      lgml0 = "log -10 --pretty=format:'%C(red)%h %C(cyan)%aI %C(green)%ar %C(blue)%aN %C(magenta)%aE %C(brightred)%D%n%n%w(108,2,2)%C(yellow)%s%n%n%w(72,4,4)%C(reset)%b%n%C(cyan)%N%C(reset)%n%n'";
      ### LoG MultiShort
      lgms0 = "log -10 --pretty=format:'%C(red)%h %C(green)%ar %C(blue)%aN %C(brightred)%D%n%n%w(108,2,2)%C(yellow)%s%n%n%w(72,4,4)%C(reset)%b%n%C(cyan)%N%C(reset)%n%n'";


      ### delete merged branches
      bdm = "!git branch --merged | grep -v '*' | xargs -n 1 git branch -d";

      ### TODO unsorted
      type   = "cat-file -t";
      dump   = "cat-file -p";
      nop    = "--no-pager";
      root   = "rev-parse --show-toplevel";
    };

    delta = {
      enable  = true;
      options = {
        # features               = "side-by-side line-numbers decorations";
        features               = "line-numbers decorations";
        decorations            = {
          commit-decoration-style = "bold yellow box ul";
          file-decoration-style   = "none";
          file-style              = "bold yellow ul";
        };
        whitespace-error-style = "22 reverse";
      };
    };

    enable = true;

    extraConfig = {

      color = {
        branch      = "always";
        decorate    = "always";
        diff        = "auto";
        grep        = "always";
        interactive = "always";
        pager       = "true";
        showbranch  = "always";
        status      = "always";
        ui          = "always";
      };

      core = {
        compression = 0;
        editor      = "emacsclient -t -a =\\\"\\\"";
        # editor    = "vim";
        # pager     = "delta"; ### cf. option delta
      };

      credential = {
        helper = "cache --timeout=360";
        # helper = "!gopass-git-credentials";
      };

      diff.sopsdiffer.textconv = "sops -d";

      http = {
        sslVerify = false;
        postBuffer = 524288000;
      };

      ### TODO emacs??
      # merge.tool = "nvim -d";

      pull.rebase = true;

      include = {
        path = "./volatiles";
      };

    };

    userEmail = userEmail;
    userName  = userDescription;
  };

  ### documentation
  home.file.".docLocal/content/homemanager/git.org".source = ./git.org;
}
