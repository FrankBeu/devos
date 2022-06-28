{ username }:
''
machine.wait_for_unit("multi-user.target")

username = "${username}"


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.security.sopsNix"):
    machine.succeed(f'[[ -s /run/secrets-for-users/{username}/password/hashed ]]')
    machine.succeed( '[[ -s /run/secrets-for-users/root/password/hashed       ]]')
    test_secret = machine.succeed('cat /run/secrets/test')
    assert_contains(test_secret, "testy")




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.security.sopsNix::ssh-to-age"):
    sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(sw_bin_content, 'ssh-to-age')
''

# Local Variables:
# mode: python
# End:
