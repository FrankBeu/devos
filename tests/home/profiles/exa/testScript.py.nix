{ hmProfileDir }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.exa"):
    hm_profile_dir = machine.succeed(f'ls {hm_profile_dir}')
    assert_contains(hm_profile_dir, 'exa')
''

# Local Variables:
# mode: python
# End:
