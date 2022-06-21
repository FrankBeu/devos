{ username }:
''
machine.wait_for_unit("graphical.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.display.i3"):
    machine.succeed('[[ -s /home/${username}/.config/i3/config ]]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.display.i3::windowToAnchor"):
    machine.succeed('[[ -s /home/${username}/.local/share/i3/windowToAnchor ]]')




### TODO check
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.display.i3::docDotLocal"):
#     machine.wait_for_unit("documentation.service")
#     output = machine.wait_until_succeeds('curl localhost:41503/homemanager/i3/')
#     assert_contains(output, "<title>i3 - Docs</title>")




### TODO check i3statusBar
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.display.i3::statusBar"):




### TODO check appearance
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.display.i3::appearance"):

    ### working screenshotTest - problematic on integrationTests TODO
    # prepare_console_for_scrot()
    # machine.send_chars("TODO\n")
    # check_golden_scrot("TODO-Target.png", "TODO-Actual")
    # restore_console_after_scrot()
''


# Local Variables:
# mode: python
# End:
