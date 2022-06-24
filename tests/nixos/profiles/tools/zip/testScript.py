machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.tools.zip"):
    sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(sw_bin_content, 'zip')
    assert_contains_line(sw_bin_content, 'unzip')
