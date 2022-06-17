{ username }:
''
machine.wait_for_unit("multi-user.target")

username       = '${username}'


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.ripgrep"):
    run_current_system = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains(run_current_system, 'rg')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.ripgrep::config"):
    machine.succeed(f'[[ -f /home/{username}/.config/ripgrep/config ]]')
''
### TODO behavior



# Local Variables:
# mode: python
# End:
