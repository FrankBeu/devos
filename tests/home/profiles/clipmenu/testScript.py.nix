{ username }:
''
machine.wait_for_unit("multi-user.target")

username = "${username}"

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.clipmenu"):
    machine.wait_until_succeeds(f"systemctl --machine={username}@.host --user status clipmenu.service | grep 'Active: active'")
''

# Local Variables:
# mode: python
# End:
