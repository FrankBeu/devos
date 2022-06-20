{ username }:
''
machine.wait_for_unit("multi-user.target")

username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.ssh::config"):
    machine.succeed(f'[[ -f /home/{username}/.ssh/config ]]')




# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.ssh::docDotLocal"):
    # machine.wait_for_unit("documentation.service")
    # output = machine.wait_until_succeeds('curl localhost:41503/homemanager/security/')
    # assert_contains(output, "<title>security - Docs</title>")
''

# Local Variables:
# mode: python
# End:
