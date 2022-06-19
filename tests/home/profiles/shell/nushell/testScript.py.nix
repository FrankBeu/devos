{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.nushell"):
        hm_profile_dir = machine.succeed("ls ${hmProfileDir}")
        assert_contains(hm_profile_dir, 'nu')
''

# Local Variables:
# mode: python
# End:
