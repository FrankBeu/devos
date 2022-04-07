{ userID }:
''
machine.wait_for_unit("graphical.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.display.i3"):
    machine.wait_for_file("/run/user/${builtins.toString userID}/")
    machine.sleep(2)
    machine.succeed('[[ -d /run/user/${builtins.toString userID}/i3 ]]')
''

# Local Variables:
# mode: python
# End:
