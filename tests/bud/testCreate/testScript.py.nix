{ budDir }:
''
### import os.path ### already imported in $${testHelpers}

machine.wait_for_unit('multi-user.target')

bud_dir                = '${budDir}' ### bud_dir == path/to/DEVOS

golden_path            = '/tmp/golden/tests.bud.testCreate'

basic_test_name        = 'basictest'
bud_test_name          = 'budtest'
golden_test_name       = 'goldentest'
suite_test_name        = 'suitetest'
variants_test_name     = 'variantstest'

### RELative to bud_dir
basic_test_path_rel    = os.path.join('tests/nixos/profiles',    basic_test_name)
bud_test_path_rel      = os.path.join('tests/bud/',                bud_test_name)
golden_test_path_rel   = os.path.join('tests/home/profiles',    golden_test_name)
suite_test_path_rel    = os.path.join('tests/nixos/suites',      suite_test_name)
variants_test_path_rel = os.path.join('tests/nixos/profiles', variants_test_name)

basic_test_chain       =    basic_test_path_rel.replace('/', '.')
bud_test_chain         =      bud_test_path_rel.replace('/', '.')
golden_test_chain      =   golden_test_path_rel.replace('/', '.')
suite_test_chain       =    suite_test_path_rel.replace('/', '.')
variants_test_chain    = variants_test_path_rel.replace('/', '.')

basic_test_path        = os.path.join(bud_dir,    basic_test_path_rel)
bud_test_path          = os.path.join(bud_dir,      bud_test_path_rel)
golden_test_path       = os.path.join(bud_dir,   golden_test_path_rel)
suite_test_path        = os.path.join(bud_dir,    suite_test_path_rel)
variants_test_path     = os.path.join(bud_dir, variants_test_path_rel)

basic_TARGET_path      = os.path.join(golden_path,    basic_test_name)
bud_TARGET_path        = os.path.join(golden_path,      bud_test_name)
golden_TARGET_path     = os.path.join(golden_path,   golden_test_name)
suite_TARGET_path      = os.path.join(golden_path,    suite_test_name)
variants_TARGET_path   = os.path.join(golden_path, variants_test_name)




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.testCreate::error:TYPE"):
    (status, error_response) = machine.execute('bud testCreate')
    assert status == 1, 'calling without TYPE and PATH must fail'
    assert_contains_regex(error_response, r'\tThe first argument has to be one of the following \[34;1mtypes\[0m:\n'\
                                          r'\t\t•\[35;1mv\[34;1mariants\[0m\n'                                    \
                                          r'\t\t•\[35;1ms\[34;1muite\[0m\n'                                       \
                                          r'\t\t•\[35;1mg\[34;1molden\[0m\n'                                      \
                                          r'\t\t•\[34;1mbu\[35;1md\[0m\n'                                         \
                                          r'\t\t•\[35;1mb\[34;1masic\[0m'                                         )
                                          ### mind the trailing \n




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.testCreate::error:LOCATION"):
    (status, error_response) = machine.execute('bud testCreate b')
    assert status == 1, 'calling without PATH must fail'
    assert_contains_regex(error_response, r'\tThe second argument has to be a \[34;1mlocation\[0m for the test.\n'                                                                                                        \
                                          r'\t\t e.g.: \[33mtests.\[0m\(\[33mbud\[0m|\[33mhome\[0m|\[33mhost\[0m|\[33mnixos\[0m\)\[\[33m.SEGMENT\[0m\[\[33m.SEGMENT\[0m\]\]\[33m.TESTNAME\[0m')
                                          ### TODO tests will not fail if second-line exists??
                                          ### mind the trailing \n



with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.testCreate::basic"):
    response = machine.succeed(f'bud testCreate b {basic_test_chain}')
    assert_contains_regex(response, fr'\tA \[34;1mbasic\[0m-Test was \[32;1mcreated\[0m in \[33m{basic_test_path}\[0m.')

    machine.succeed(f'diff -r {basic_TARGET_path} {basic_test_path}')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.testCreate::bud"):
    response = machine.succeed(f'bud testCreate d {bud_test_chain}')
    assert_contains_regex(response, fr'\tA \[34;1mbud\[0m-Test was \[32;1mcreated\[0m in \[33m{bud_test_path}\[0m.')

    machine.succeed(f'diff -r {bud_TARGET_path} {bud_test_path}')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.testCreate::golden"):
    response = machine.succeed(f'bud testCreate g {golden_test_chain}')
    assert_contains_regex(response, fr'\tA \[34;1mgolden\[0m-Test was \[32;1mcreated\[0m in \[33m{golden_test_path}\[0m.')

    machine.succeed(f'diff -r {golden_TARGET_path} {golden_test_path}')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.testCreate::suite"):
    response = machine.succeed(f'bud testCreate s {suite_test_chain}')
    assert_contains_regex(response, fr'\tA \[34;1msuite\[0m-Test was \[32;1mcreated\[0m in \[33m{suite_test_path}\[0m.')

    machine.succeed(f'diff -r {suite_TARGET_path} {suite_test_path}')



with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.testCreate::variants"):
    response = machine.succeed(f'bud testCreate v {variants_test_chain}')
    assert_contains_regex(response, fr'\tA \[34;1mvariants\[0m-Test was \[32;1mcreated\[0m in \[33m{variants_test_path}\[0m.')

    machine.succeed(f'diff -r {variants_TARGET_path} {variants_test_path}')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.testCreate::error:dirExists"):
    (status, error_response) = machine.execute(f'bud testCreate b {basic_test_chain}')
    assert status == 1, "calling on an existing PATH must fail"
    assert_contains_regex(error_response, fr'\tA directory \[31;1malready exists\[0m at \[33m{basic_test_path}\[0m.')
''



# Local Variables:
# mode: python
# End:
