{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.fuzzy.fzf"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains(hm_bin_content, 'fzf')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.fuzzy.fzf::config"):
    machine.wait_for_file(f"/home/{username}/.config/zsh/.zshrc")
    zshrc = machine.succeed(f'cat /home/{username}/.config/zsh/.zshrc')
    assert_contains(zshrc, 'fzf-history-widget-accept()')




# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.fuzzy.fzf::docDotLocal"):
#     machine.wait_for_unit("documentation.service")
#     output = machine.wait_until_succeeds('curl localhost:41503/homemanager/shell/')
#     assert_contains(output, "<title>shell - Docs</title>")

### TODO behavior needs display & passthrou
''

# Local Variables:
# mode: python
# End:
