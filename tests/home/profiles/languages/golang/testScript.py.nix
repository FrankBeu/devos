{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.git::docDotLocal"):

    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains_line(hm_bin_content, 'go')
    assert_contains_line(hm_bin_content, 'gofumpt')
    assert_contains_line(hm_bin_content, 'goimports')
    assert_contains_line(hm_bin_content, 'gomodifytags')
    assert_contains_line(hm_bin_content, 'golangci-lint')
    assert_contains_line(hm_bin_content, 'gopls')
    assert_contains_line(hm_bin_content, 'gotests')
    assert_contains_line(hm_bin_content, 'gotestsum')
    assert_contains_line(hm_bin_content, 'go-outline')
    assert_contains_line(hm_bin_content, 'impl')
    assert_contains_line(hm_bin_content, 'reflex')
''



# Local Variables:
# mode: python
# End:
