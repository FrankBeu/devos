{ hmProfileDir }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.browser.chromium"):
    # runCurrentSystem = machine.succeed('ls /run/current-system/sw/bin')
    runCurrentSystem = machine.succeed("ls ${hmProfileDir}")
    assert_contains(runCurrentSystem, 'chromium')

    ### TODO check behaviour
    ### TODO check plugins
''


# Local Variables:
# mode: python
# End:
