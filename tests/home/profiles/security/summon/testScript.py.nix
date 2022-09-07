{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = "${hmProfileDir}"
username       = "${username}"


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.summon"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains_line(hm_bin_content, 'summon')
    assert_contains_line(hm_bin_content, 'gopass-summon-provider')

    machine.succeed(f'[[ -f /home/{username}/.local/bin/summonBrownie        ]]')
    machine.succeed(f'[[ -f /home/{username}/.local/bin/summonFlask          ]]')
    machine.succeed(f'[[ -f /home/{username}/.local/bin/summonPulumi         ]]')
''

# Local Variables:
# mode: python
# End:
