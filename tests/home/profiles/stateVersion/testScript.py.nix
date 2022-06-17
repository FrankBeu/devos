{ username }:
''
machine.wait_for_unit("multi-user.target")

# username = ${username}

### TODO after fixing of nixos-option
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.stateVersion"):
#     o = machine.succeed('nixos-option')
#     machine.log(o)
#     stateVersion = machine.succeed(f 'nixos-option home-manager.users.{username}.home.stateVersion')
#     ### TODO assert is equal to set value
''

# Local Variables:
# mode: python
# End:
