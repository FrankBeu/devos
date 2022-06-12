machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.tools.network"):
        output = machine.succeed('ls /run/current-system/sw/bin/')
        assert_contains(output, 'dig')

        output = machine.succeed('ls /run/current-system/sw/bin/')
        assert_contains(output, 'ethtool')

        output = machine.succeed('ls /run/current-system/sw/bin/')
        assert_contains(output, 'gobuster')

        output = machine.succeed('ls /run/current-system/sw/bin/')
        assert_contains(output, 'drill')
