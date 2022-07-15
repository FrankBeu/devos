machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.image.common"):
    output = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(output, 'riv')
    assert_contains_line(output, 'img2pdf')


### TODO check if patch is applied (behavior)
