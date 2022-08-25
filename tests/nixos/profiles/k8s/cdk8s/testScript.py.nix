{ ... }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.k8s.cdk8s"):
        sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
        assert_contains_line(sw_bin_content, 'cdk8s')
''

# Local Variables:
# mode: python
# End:
