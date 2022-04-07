{ username }:
''
machine.wait_for_unit("graphical.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.display.i3"):
    machine.wait_for_file("/home/${username}/.config/")
    machine.sleep(2)
    machine.succeed('[[ -f /home/${username}/.config/i3/config ]]')

### TODO
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ check i3-colors"):

    ### working screenshotTest - problematic on integrationTests TODO
    # prepare_console_for_scrot()
    # machine.send_chars("TODO\n")
    # check_golden_scrot("TODO-Target.png", "TODO-Actual")
    # restore_console_after_scrot()
''


# Local Variables:
# mode: python
# End:
