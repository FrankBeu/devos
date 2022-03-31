machine.wait_for_unit("multi-user.target")

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ profiles.display.statusBar.i3statusBar"):

    runCurrentSystem = machine.succeed('ls /run/current-system/sw/bin')
    assert_contains(runCurrentSystem, 'i3statusBar')
    assert_contains(runCurrentSystem, 'i3statusBarTime')
