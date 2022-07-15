{ username }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.bud"):
    run_current_system = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(run_current_system, 'bud')
    assert_contains_line(run_current_system, 'nixos-generate')

    ### check test-setup - this test is run prior to each test.bud.*
    localFlakeClone = machine.succeed('ls /home/${username}')
    assert_contains(localFlakeClone, 'DEVOS')
''

# Local Variables:
# mode: python
# End:
