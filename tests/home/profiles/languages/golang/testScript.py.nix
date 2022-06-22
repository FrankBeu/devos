{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.git::docDotLocal"):
    hm_profile_dir = machine.succeed(f'ls {hm_profile_dir}')
    assert_contains_line(hm_profile_dir, 'go')
    assert_contains_line(hm_profile_dir, 'gofumpt')
    assert_contains_line(hm_profile_dir, 'goimports')
    assert_contains_line(hm_profile_dir, 'gomodifytags')
    assert_contains_line(hm_profile_dir, 'golangci-lint')
    assert_contains_line(hm_profile_dir, 'gopls')
    assert_contains_line(hm_profile_dir, 'gotests')
    assert_contains_line(hm_profile_dir, 'gotestsum')
    assert_contains_line(hm_profile_dir, 'go-outline')
    assert_contains_line(hm_profile_dir, 'impl')
    assert_contains_line(hm_profile_dir, 'reflex')
''



# Local Variables:
# mode: python
# End:
