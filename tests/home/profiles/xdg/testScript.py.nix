{ username }:
''
machine.wait_for_unit("multi-user.target")

username = "${username}"


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.xdg"):
    machine.succeed(f'[[ -L /home/{username}/.config/user-dirs.dirs ]]')

''

# Local Variables:
# mode: python
# End:
