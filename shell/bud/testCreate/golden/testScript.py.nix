{ username }:
''
machine.wait_for_unit("graphical.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ <TESTNAME>"):
    ### working screenshotTest - problematic on integrationTests TODO
    # prepare_console_for_scrot()
    # machine.send_chars("TODO\n")
    # check_golden_scrot("TODO-Target.png", "TODO-Actual")
    # restore_console_after_scrot()
''

# Local Variables:
# mode: python
# End:
