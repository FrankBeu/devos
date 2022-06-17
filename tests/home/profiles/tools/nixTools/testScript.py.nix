{ username }:
''
machine.wait_for_unit("multi-user.target")

username = "${username}"

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.tools.nixTools"):
    ### find search in standalone~ and host~tests
    zshrc_path = machine.succeed(f"fd --hidden --max-results 1 --maxdepth 1 --search-path /home/{username} --search-path /home/{username}/.config/zsh .zshrc")
    zshrc = machine.succeed(f"cat {zshrc_path}")
    ### just ensure nix-index would be available - building the actual index and installing zsh would be to expensive
    assert_contains_regex(zshrc, "source /nix/store/.*/etc/profile.d/command-not-found.sh")


''

# Local Variables:
# mode: python
# End:
