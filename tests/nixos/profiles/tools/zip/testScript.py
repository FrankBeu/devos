machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.tools.zip"):
        run_current_system = machine.succeed('ls /run/current-system/sw/bin/')
        assert_contains(run_current_system, 'zip')
        assert_contains(run_current_system, 'unzip')
