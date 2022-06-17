machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.tools.gpu"):
        output = machine.succeed('ls /run/current-system/sw/bin/')
        assert_contains(output, 'vulkaninfo')
        assert_contains(output, 'glxinfo')
