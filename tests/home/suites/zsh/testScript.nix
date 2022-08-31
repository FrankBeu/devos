{ hmProfileDir, username }:
let
  home-profile-shell-aliases           = (import ../../profiles/shell/aliases/testScript.py.nix              { inherit              username;});
  home-profile-shell-cod               = (import ../../profiles/shell/cod/testScript.py.nix                  { inherit hmProfileDir username;});
  home-profile-shell-fuzzy-fzf         = (import ../../profiles/shell/fuzzy/fzf/testScript.py.nix            { inherit hmProfileDir username;});
  home-profile-shell-snippets-pet      = (import ../../profiles/shell/snippets/pet/testScript.py.nix         { inherit hmProfileDir username;});
  home-profile-shell-vivid             = (import ../../profiles/shell/vivid/testScript.py.nix                { inherit hmProfileDir username;});
  home-profile-shell-zsh               = (import ../../profiles/shell/zsh/testScript.py.nix                  { inherit hmProfileDir username;});
in
{
  testScript = ''
    ${home-profile-shell-aliases}
    ${home-profile-shell-cod}
    ${home-profile-shell-fuzzy-fzf}
    ${home-profile-shell-snippets-pet}
    ${home-profile-shell-vivid}
    ${home-profile-shell-zsh}               ### depends on nixos.profiles.shell.zsh
                                            ### prompts:   nixos.profiles.shell.prompts
  '';
}
