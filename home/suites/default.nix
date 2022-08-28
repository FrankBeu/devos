{ profiles, ...}:
with profiles; rec
{
  # base = [ direnv git ];
  # core = [ direnv git shell.aliases shell.starship ];
  # base = [ direnv     ];
  zsh =  [
    shell.aliases
    # shell.cod              ### TODO currently broken
    shell.fuzzy.fzf
    shell.snippets.pet
    shell.vivid
    shell.zsh                ### depends on nixos.profiles.shell.zsh
    stateVersion             ### stateVersion is needed for location of zsh_history
    ### prompts can be found at nixos.profiles.shell.zsh because they have to be available for root
  ];
}
