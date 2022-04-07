{ userID }:
''
machine.wait_for_unit("graphical.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.display.gnome"):
    machine.wait_for_file("/run/user/${builtins.toString userID}/")
    machine.sleep(2)
    machine.succeed('[[ -p /run/user/${builtins.toString userID}/gnome-session-leader-fifo ]]')
''

# Local Variables:
# mode: python
# End:
