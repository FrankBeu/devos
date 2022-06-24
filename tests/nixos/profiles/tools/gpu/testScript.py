machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.tools.gpu"):
    sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(sw_bin_content, 'vulkaninfo')
    assert_contains_line(sw_bin_content, 'glxinfo')
