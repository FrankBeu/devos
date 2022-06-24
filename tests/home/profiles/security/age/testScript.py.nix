{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.age"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains_line(hm_bin_content, 'age')



### TODO
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.age::docDotLocal"):
    # machine.wait_for_unit("documentation.service")
    # output = machine.wait_until_succeeds('curl localhost:41503/homemanager/security/')
    # assert_contains(output, "<title>security - Docs</title>")
''

# Local Variables:
# mode: python
# End:
