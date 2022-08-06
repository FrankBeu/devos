{ ... }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.tools.revealjs"):
    sw_share_content = machine.succeed('ls /run/current-system/sw/share/')
    assert_contains_line(sw_share_content, 'revealjs')
''

# Local Variables:
# mode: python
# End:
