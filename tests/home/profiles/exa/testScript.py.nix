{ hmProfileDir }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.exa"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains_line(hm_bin_content, 'exa')
''

# Local Variables:
# mode: python
# End:
