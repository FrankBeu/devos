{ username }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.nuke"):
    ### CREATE TARGETS
    machine.succeed("mkdir /home/${username}/DEVOS/result/")
    machine.succeed("touch /home/${username}/DEVOS/result/test-script")
    machine.succeed("touch /home/${username}/DEVOS/testvm.qcow2")
    machine.succeed("touch /home/${username}/DEVOS/ryzenvm.qcow2")

    ### BEFORE
    bud_dir = machine.succeed("ls /home/${username}/DEVOS")
    assert_contains(bud_dir, 'result')
    assert_contains(bud_dir, 'ryzenvm.qcow2')
    assert_contains(bud_dir, 'testvm.qcow2')

    ### NUKE
    machine.succeed("bud nuke") ### executed in /tmp; ensures $${FLAKEROOT} is set

    ### AFTER
    bud_dir = machine.succeed("ls /home/${username}/DEVOS")
    assert_lacks(bud_dir, 'result')
    assert_lacks(bud_dir, 'ryzenvm.qcow2')
    assert_lacks(bud_dir, 'testvm.qcow2')
''

# Local Variables:
# mode: python
# End:
