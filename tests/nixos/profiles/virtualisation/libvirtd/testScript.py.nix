{ userID }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.virtualisation.libvirtd"):
    output = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains(output, 'libvirtd')

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.virtualisation.libvirtd::group"):
    output = machine.succeed('getent group')
    assert_contains(output, 'libvirtd')

    output = machine.succeed('id ${builtins.toString userID}')
    assert_contains(output, 'libvirtd')
''

# Local Variables:
# mode: python
# End:
