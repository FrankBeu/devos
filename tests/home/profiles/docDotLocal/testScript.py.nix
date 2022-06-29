{ username }:
''
machine.wait_for_unit("multi-user.target")

username = "${username}"


### TODO doc
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.docDotLocal"):
#     machine.wait_for_unit("documentation.service")
#     output = machine.wait_until_succeeds('curl localhost:41503/homemanager/backup/')
#     assert_contains(output, "<title>backup - Docs</title>")

#     output = machine.wait_until_succeeds('curl localhost:41503/homemanager/security/')
#     assert_contains(output, "<title>security - Docs</title>")

#     output = machine.wait_until_succeeds('curl localhost:41503/homemanager/shell/')
#     assert_contains(output, "<title>shell - Docs</title>")




### TODO check behavior
with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.docDotLocal::i3config"):
    machine.wait_for_file(f"/home/{username}/.config/i3/config")
    i3_config = machine.succeed(f'cat /home/{username}/.config/i3/config')

    assert_contains_regex(i3_config,'bindsym *\$mod\+F1  exec --no-startup-id .* "http://doc.local"')
''

# Local Variables:
# mode: python
# End:
