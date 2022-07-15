{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.tools.sound"):
    hm_profile_dir = machine.succeed("ls ${hmProfileDir}/bin")
    assert_contains(hm_profile_dir, 'ncpamixer')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.tools.sound::config"):
    machine.succeed(f"[[ -s /home/{username}/.config/ncpamixer.conf ]]")
    machine.succeed(f"[[ -s /home/{username}/.config/alsamixer.rc   ]]")

''

# Local Variables:
# mode: python
# End:
