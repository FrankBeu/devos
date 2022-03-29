{ username }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ nixos.profiles.autologin.mainUser: login as $${mainUser}"):
    machine.sleep(1)
    output = machine.get_screen_text()
    assert_contains(output, "${username}")
    # machine.log(print(output))
''


# Local Variables:
# mode: python
# End:
