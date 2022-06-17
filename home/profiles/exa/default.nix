{ pkgs, ... }:
{
  programs.exa = {
    enable        = true;
    enableAliases = false;   ### will conflict with the other aliases
  };

  home.shellAliases = {
    la  = ''exa --icons --group-directories-first       -a''                                                                                      ;  ### one row
    lk  = ''exa --icons --group-directories-first --git -lbF''                                                                           ;  ### list, size, type, git
    lkm = ''exa --icons --group-directories-first --git -lbF          --sort=modified''                                                  ;  ### long list, Modified date sort
    ls  = ''exa --icons --group-directories-first       -1''                                                                             ;  ### one column, just names
    lsf = ''exa --icons --group-directories-first --git -lbhHigUmuSa  --time-style=long-iso                       --color-scale''        ;  ### all list Full
    x   = ''exa --icons --group-directories-first --git -lbhHigUmuSa@ --time-style=long-iso                       --color-scale''        ;  ### all + eXtended list
    ### Tree
    lt  = ''exa --icons --group-directories-first                                           --tree --color=always --level=2     | less'' ;  ### Tree
    ltl = ''exa --icons --group-directories-first --git -lbF                                --tree --color=always --level=2     | less'' ;  ### Tree Long
    lta = ''exa --icons --group-directories-first                                           --tree --color=always               | less'' ;  ### Tree All
    ltx = ''exa --icons --group-directories-first --git -lbhHigUmuSa@ --time-style=long-iso --tree --color=always --color-scale | less'' ;  ### Tree eXt
  };
}
### TODO doc
### https://github.com/nix-community/home-manager/blob/master/modules/programs/exa.nix
