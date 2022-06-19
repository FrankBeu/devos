{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = "${hmProfileDir}"
username       = "${username}"

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.summon"):
        hm_profile_dir = machine.succeed("ls ${hmProfileDir}")
        assert_contains(hm_profile_dir, 'summon')

        machine.succeed(f'[[ -f /home/{username}/.local/bin/summonBrownie        ]]')
        machine.succeed(f'[[ -f /home/{username}/.local/bin/summonFlask          ]]')
        machine.succeed(f'[[ -f /home/{username}/.local/bin/summonGopassProvider ]]')
        machine.succeed(f'[[ -f /home/{username}/.local/bin/summonPulumi         ]]')


''

# Local Variables:
# mode: python
# End:
