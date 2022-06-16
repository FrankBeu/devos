{ budDir, username }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.prepvm::error"):
    (status, error_response) = machine.execute('TEST_USER=${username} bud prepvm nonexisting')
    assert status == 1, "calling nonexistent prepareScripts must fail"
    assert_contains_regex(error_response, r"  setupscript \[35m${budDir}/shell/bud/prepvm/\[33mnonexisting\[0m does \[31;1mnot\[0m exist yet")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.prepvm::setenv"):
    environment_before_prep = machine.succeed('env')
    assert_lacks_regex(environment_before_prep, r"QEMU_.*")

    response = machine.succeed('TEST_USER=${username} bud prepvm test')
    assert_contains_regex(response, r"source ${budDir}/shell/bud/prepvm/test")

    environment_after_prep = machine.succeed('source ${budDir}/shell/bud/prepvm/test && '\
                                             'env')

    machine.log(environment_after_prep)
    assert_contains_regex(environment_after_prep, r"QEMU_.*")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.prepvm::unsetenv"):
    response = machine.succeed('TEST_USER=${username} bud prepvm clear')
    assert_contains_regex(response, r"source ${budDir}/shell/bud/prepvm/clear")

    environment_after_reset = machine.succeed('source ${budDir}/shell/bud/prepvm/test  && '\
                                              'source ${budDir}/shell/bud/prepvm/clear && '\
                                              'env')

    assert_lacks_regex(environment_after_reset, r"QEMU_.*")
''

# Local Variables:
# mode: python
# End:
