machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.image.common"):
    output = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(output, 'riv')
    machine.log(output)

### TODO check if patch is applied (behavior)
