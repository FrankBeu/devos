{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.git"):
    hm_profile_dir = machine.succeed(f'ls {hm_profile_dir}')
    assert_contains(hm_profile_dir, 'git')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.git::config"):
    machine.succeed(f'[[ -f /home/{username}/.config/git/config     ]]')
    machine.succeed(f'[[ -f /home/{username}/.config/git/attributes ]]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.git::docDotLocal"):
    machine.wait_for_unit("documentation.service")
    output = machine.wait_until_succeeds('curl localhost:41503/homemanager/git/')
    assert_contains(output, "<title>git - Docs</title>")
''
### TODO behavior



# Local Variables:
# mode: python
# End:
