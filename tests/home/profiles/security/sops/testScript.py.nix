{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.sops"):
    hm_profile_dir = machine.succeed(f'ls {hm_profile_dir}')
    assert_contains(hm_profile_dir, 'sops')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.sops::sopsAge"):
    machine.succeed(f'[[ -s /home/{username}/.local/share/sops/sopsAge ]]')
    ### TODO tests script and alias





# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.security.sops::docDotLocal"):
#     machine.wait_for_unit("documentation.service")
#     output = machine.wait_until_succeeds('curl localhost:41503/homemanager/security/')
#     assert_contains(output, "<title>security - Docs</title>")
''

# Local Variables:
# mode: python
# End:
