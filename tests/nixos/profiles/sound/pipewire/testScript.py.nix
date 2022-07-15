{ username }:
''
username       = '${username}'


machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.sound.pipewire"):
    # machine.wait_until_succeeds(f"systemctl --machine={username}@.host --user status pipewire.service | grep 'Active: active (running)'")
    machine.wait_until_succeeds(f"systemctl --machine={username}@.host --user status pipewire.service | grep 'Loaded: loaded'")




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.sound.pipewire::helvum"):
    sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(sw_bin_content, 'helvum')



### TODO
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.sound.pipewire::docDotLocal"):
#     machine.wait_for_unit("documentation.service")
#     output = machine.wait_until_succeeds('curl localhost:41503/system/pipewire/')
#     assert_contains(output, "<title>pipewire - Docs</title>")
''

# Local Variables:
# mode: python
# End:
