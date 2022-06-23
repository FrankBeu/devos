{ username }:
''
machine.wait_for_unit("multi-user.target")

username       = '${username}'


### TODO refine after alias-module
with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.aliases"):
    zshrc = machine.wait_until_succeeds(f'cat /home/{username}/.config/zsh/.zshrc')
    assert_contains(zshrc, "alias sys='sudo systemctl'")
    # assert_contains_regex(zshrc, r'zsh-defer \+1 \+2 source <\(cod init \$\$ zsh\)')
    # alias = machine.succeed(f"su - {username} -c '"                                      \
    #                         f'zsh -c "source /home/{username}/.config/zsh/.zshrc; alias"'\
    #                          "'"                                                         )
    # assert_contains_line(alias, "sys=\'sudo systemctl\'")
    ### fails on host-test

''

# Local Variables:
# mode: python
# End:
