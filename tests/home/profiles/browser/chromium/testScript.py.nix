{ hmProfileDir }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.browser.chromium"):
    hmProfileDir = machine.succeed("ls ${hmProfileDir}")
    assert_contains(hmProfileDir, 'chromium')

    ### TODO check behaviour
    ### TODO check plugins
''


# Local Variables:
# mode: python
# End:
