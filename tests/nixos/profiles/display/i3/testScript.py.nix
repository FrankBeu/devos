{ userID }:
''
machine.wait_for_unit("graphical.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.display.i3"):
    machine.wait_for_file("/run/user/${builtins.toString userID}/i3")




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.display.i3::tools"):
    run_current_system = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains(run_current_system, 'xkill')
    assert_contains(run_current_system, 'xsel')
    assert_contains(run_current_system, 'xwininfo')




### TODO
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.display.i3::docDotLocal"):
#     machine.wait_for_unit("documentation.service")
#     output = machine.wait_until_succeeds('curl localhost:41503/system/xserver/')
#     assert_contains(run_current_system, '<title>xserver - Docs</title>')




### TODO test behavior
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.display.i3::keybindings"):
''

# Local Variables:
# mode: python
# End:
