{
  programs.git = {
    enable = true;

    extraConfig = {
      pull.rebase = false;
    };

    aliases = {
      a   = "add -p";
      bD  = "branch -D";
      ba  = "branch -a";
      bd  = "branch -d";
      c   = "commit";
      co  = "checkout";
      cob = "checkout -b";
      d   = "diff";
      dc  = "diff --cached";
      ds  = "diff --staged";
      f   = "fetch -p";
      i   = "init";
      p   = "push";
      r   = "restore";
      ro  = "remote get-url origin";
      rs  = "restore --staged";
      st  = "status -sb";

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
    };

  };
}
