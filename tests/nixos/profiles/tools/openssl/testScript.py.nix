{}:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.tools.openssl"):
        sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
        assert_contains_line(sw_bin_content, 'openssl')
''

# Local Variables:
# mode: python
# End:
