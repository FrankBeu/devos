{ hmProfileDir }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir  = '${hmProfileDir}'


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.browser.chromium"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains(hm_bin_content, 'chromium')

    ### TODO check behaviour
    ### TODO check plugins
''


# Local Variables:
# mode: python
# End:
