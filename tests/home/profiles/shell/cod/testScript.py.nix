{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.cod"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains(hm_bin_content, 'cod')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.cod::config"):
    zshrc = machine.wait_until_succeeds(f'cat /home/{username}/.config/zsh/.zshrc')
    assert_contains_regex(zshrc, r'zsh-defer \+1 \+2 source <\(cod init \$\$ zsh\)')
''

# Local Variables:
# mode: python
# End:
