machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ nixos.profiles.autologin.root: login as root"):
    machine.sleep(1)
    output = machine.get_screen_text()
    assert_contains(output, "root")
    # machine.log(print(output))
