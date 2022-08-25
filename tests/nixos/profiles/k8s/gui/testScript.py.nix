{ ... }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.k8s.gui"):
        sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
        assert_contains_line(sw_bin_content, 'lens')
        assert_contains_line(sw_bin_content, 'octant')

''

# Local Variables:
# mode: python
# End:
