{ userID }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.tools.android"):
    sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(sw_bin_content, 'aft-mtp-mount')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.tools.android::group"):
    output = machine.succeed('getent group')
    assert_contains(output, 'adbusers')

    output = machine.succeed('id ${builtins.toString userID}')
    assert_contains(output, 'adbusers')
''

# Local Variables:
# mode: python
# End:
