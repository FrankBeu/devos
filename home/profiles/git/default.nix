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
      a    = "add -p";
      al   = "config --get-regexp '^alias\.'"     ;### ALiases
      ad   = "add ."                              ;### Add Dot
      bD   = "branch -D";
      ba   = "branch -a";
      bd   = "branch -d";
      c    = "commit";
      cl   = "clone";
      co   = "checkout";
      cob  = "checkout -b";
      d    = "diff";
      dc   = "diff --cached";
      ds   = "diff --staged";
      f    = "fetch -p";
      i    = "init";
      ### swls                                ;### SkipWorktree LS -> check home.shellAliases
      swa  = "update-index --skip-worktree "  ;### SkipWorktree Add    <FILE>
      swr  = "update-index --no-skip-worktree";### SkipWorktree Remove <FILE>
      p    = "push";
      r    = "restore";
      ro   = "remote get-url origin"              ;### Remote Origin
      rg   = "remote get-url github"              ;### Remote Github
      rs   = "restore --staged";
      st   = "status -sb";


      ### reset
      soft = "reset --soft";
      hard = "reset --hard";
      s1ft = "soft HEAD~1";
      h1rd = "hard HEAD~1";

      ### logging
      lg   = "log --color --graph --pretty =format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      plog = "log --graph --pretty         ='format:%C(red)%d%C(reset) %C(yellow)%h%C(reset) %ar %C(green)%aN%C(reset) %s'";
      tlog = "log --stat --since           ='1 Day Ago' --graph --pretty =oneline --abbrev-commit --date =relative";
      rank = "shortlog -sn --no-merges";

      ### delete merged branches
      bdm = "!git branch --merged | grep -v '*' | xargs -n 1 git branch -d";

      ### TODO unsorted
      hist   = "log --pretty=format:\"%C(reset)%C(yellow)%h %C(cyan)%ad %C(green)[%an]%C(reset) %<(50)%s %C(bold red)%d %C(white)\" -10 --graph --date=short";
      histnp = "!git --no-pager log --pretty=format:\"%C(reset)%C(yellow)%h %C(cyan)%ad %C(green)[%an]%C(reset) %<(50)%s %C(bold red)%d %C(white)\" -10 --graph --date=short; echo";
      type   = "cat-file -t";
      dump   = "cat-file -p";
      nop    = "--no-pager";
      mylog  = "!git log --pretty=format:'%h|%an|%s' | while IFS='|' read hash author message; do printf '%s %-20s %s\n' \"$hash\" \"$author\" \"$message\"; done";
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
        # pager       = "delta"; ### cf. option delta
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
