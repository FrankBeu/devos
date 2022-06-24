{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.gopass"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains_line(hm_bin_content, 'gopass')
    assert_contains_line(hm_bin_content, 'gopass-jsonapi')
    assert_contains_line(hm_bin_content, 'git-credential-gopass')
    assert_contains_line(hm_bin_content, 'xdotool')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.gopass::config"):
    machine.succeed(f'[[ -L /home/{username}/.config/gopass/config.yml ]]')




# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.gopass::docDotLocal"):
#     machine.wait_for_unit("documentation.service")
#     output = machine.wait_until_succeeds('curl localhost:41503/homemanager/gopass/')
#     assert_contains(output, "<title>gopass - Docs</title>")




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.gopass::docLocal"):
    machine.succeed(f'[[ -s /home/{username}/.local/bin/gopb ]]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.gopass::i3config"):
    i3config = machine.succeed(f'cat /home/{username}/.config/i3/config')
    assert_contains(i3config, 'for_window [class="gopass"]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.gopass::manualActions"):
    manualActions = machine.succeed(f'cat /home/{username}/.manualActions/manualActions.org')
    assert_contains(manualActions, '** gopass\n'     \
                                   '*** TODO setup\n'\
                                   '***** from SAFE' )
                                   ### mind the trailing \n
''

# Local Variables:
# mode: python
# End:
