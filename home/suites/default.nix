{ profiles, ...}:
with profiles; rec
{
  # base = [ direnv git ];
  # core = [ direnv git shell.aliases shell.starship ];
  # base = [ direnv     ];
  zsh =  [
    shell.aliases
    shell.cod
    shell.fuzzy.fzf
    # shell.prompts.powerline ### TODO colors
    shell.prompts.starship
    shell.snippets.pet
    shell.vivid
    shell.zsh                ### depends on nixos.profiles.shell.zsh
    stateVersion             ### stateVersion is needed for location of zsh_history
  ];
}
