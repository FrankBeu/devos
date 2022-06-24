{ userID }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.virtualisation.docker"):
    sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(sw_bin_content, 'docker')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.virtualisation.docker::group"):
    output = machine.succeed('getent group')
    assert_contains(output, 'docker')

    output = machine.succeed('id ${builtins.toString userID}')
    assert_contains(output, 'docker')
''

# Local Variables:
# mode: python
# End:
