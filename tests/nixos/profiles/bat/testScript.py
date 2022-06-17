machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.bat"):
    run_current_system = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains(run_current_system, 'bat')
    assert_contains(run_current_system, 'batdiff')
    assert_contains(run_current_system, 'batgrep')
    assert_contains(run_current_system, 'batman')
    assert_contains(run_current_system, 'batwatch')
    assert_contains(run_current_system, 'prettybat')
