{ budDir, username }:
''
### import os.path ### already imported in $${testHelpers}

machine.wait_for_unit("graphical.target")

username                       = "${username}"

bud_dir                        = "${budDir}" ### bud_dir == path/to/DEVOS

profile_dotLocal_bin_path      = os.path.join(bud_dir, "home/profiles/dotLocal/bin")

golden_path                    = "/tmp/golden/tests.bud.template"

i3_template_name               = "templateTestI3"
dotLocal_template_name         = "templateTestDotLocal"

### RELative to bud_dir
### clF currentLocationFalse
### clT currentLocationTrue
i3_template_path_rel           = os.path.join('home', 'profiles',       i3_template_name       )
dotLocal_template_path_rel_clF = os.path.join('home', 'profiles', dotLocal_template_name, 'clF')
dotLocal_template_path_rel_clT = os.path.join('home', 'profiles', dotLocal_template_name, 'clT')

dotLocal_tmp_path_clF          = os.path.join('/home', username, 'tmp', 'dotLocal', 'clF')
dotLocal_tmp_path_clT          = os.path.join('/home', username, 'tmp', 'dotLocal', 'clT')

i3_template_path               = os.path.join(bud_dir,       i3_template_path_rel    )
dotLocal_template_path_clF     = os.path.join(bud_dir, dotLocal_template_path_rel_clF)
dotLocal_template_path_clT     = os.path.join(bud_dir, dotLocal_template_path_rel_clT)

i3_TARGET_path                 = os.path.join(golden_path, 'i3'                              )
dotLocal_TARGET_path_clF       = os.path.join(golden_path, 'dotLocal', 'currentLocationFalse')
dotLocal_TARGET_path_clT       = os.path.join(golden_path, 'dotLocal', 'currentLocationTrue' )




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.template::error:TYPE"):
    (status, error_response) = machine.execute('bud template')
    assert status == 1, "calling without TYPE must fail"
    assert_contains_regex(error_response, r'\tThe first argument has to be one of the following \[34;1mtypes\[0m:\n'\
                                          r'\t\t•\[35;1mi\[34;1m3\[0m\n'                                          \
                                          r'\t\t•\[35;1md\[34;1motLocal\[0m'                                      )
                                          ### mind the trailing \n




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.template::i3"):
    machine.wait_for_x()

    ### create required directory
    machine.succeed(f'su - {username} -c        " '\
                    f'mkdir -p {i3_template_path} '\
                    f'"'                           )

    ### instantiate the templates
    machine.succeed(f'su - {username} -c     " '\
                    f'cd {i3_template_path} && '\
                    f'export DISPLAY=:0     && '\
                    f'bud template i > message '\
                    f'"'                        )

    ### create a file from clipboard
    machine.succeed(f'su - {username} -c     " '\
                    f'cd {i3_template_path} && '\
                    f'export DISPLAY=:0 &&     '\
                    f'xsel -ob > clipboard     '\
                    f'"'                        )

    ### compare {TARGET,ACTUAL}
    machine.succeed(f'diff -r {i3_TARGET_path} {i3_template_path}')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.template::dotLocal:currentLocationFalse"):
    machine.wait_for_x()
    script_name = dotLocal_template_name

    ### create required directory only used as directory to compare TARGET against
    machine.succeed(f'su - {username} -c "'                  \
                    f'mkdir -p {dotLocal_template_path_clF} '\
                    f'"'                                     )

    ### instantiate the templates
    machine.succeed(f'su - {username} -c " '                                      \
                    f'cd {dotLocal_template_path_clF} && '                        \
                    f'export DISPLAY=:0 && '                                      \
                    fr'printf "{script_name}\\\\nN"| bud template d > {dotLocal_tmp_path_clF}/message'\
                    f'"'                                                          )

    ### copy created script, in order to be able to diff recursively
    machine.succeed(f'su - {username} -c "'                           \
                    f'mkdir -p {dotLocal_template_path_clF}/dotLocal '\
                    f'"'                                              )

    ### compare {TARGET,ACTUAL}
    machine.succeed(f'diff {dotLocal_TARGET_path_clF}/dotLocal/{script_name} {profile_dotLocal_bin_path}/{script_name}')

    response = machine.succeed(f'cat {dotLocal_tmp_path_clF}/message')
    assert_contains_regex(response, fr"""\tA \[34;1mdotLocal\[0m-script-template was \[32;1mcreated:\[0m \[33m{profile_dotLocal_bin_path}/{dotLocal_template_name}\[0m.""")




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.template::dotLocal:currentLocationTrue"):
    machine.wait_for_x()
    script_name = dotLocal_template_name

    ### create required directory
    machine.succeed(f'su - {username} -c "'                  \
                    f'mkdir -p {dotLocal_template_path_clT} '\
                    f'"'                                     )

    ### instantiate the templates
    machine.succeed(f'su - {username} -c " '                                                              \
                    f'cd {dotLocal_template_path_clT} && '                                                \
                    f'export DISPLAY=:0 && '                                                              \
                    fr'printf "{script_name}\\\\ny"| bud template d > {dotLocal_tmp_path_clT}/message'    \
                    f'"'                                                                                  )

    ### create a file from clipboard
    machine.succeed(f'su - {username} -c "'                         \
                    f'cd {dotLocal_template_path_clT} && '          \
                    f'export DISPLAY=:0 && '                        \
                    f'xsel -ob > {dotLocal_tmp_path_clT}/clipboard '\
                    f'"'                                            )

    # ### compare {TARGET,ACTUAL}
    machine.succeed(f'diff -r {dotLocal_TARGET_path_clT} {dotLocal_template_path_clT}')

    message = machine.succeed(f'cat {dotLocal_tmp_path_clT}/message')
    assert_contains_regex(message, fr'\tA \[34;1mdotLocal\[0m-script-template was \[32;1mcreated:\[0m \[33m{dotLocal_template_path_clT}/dotLocal/{script_name}\[0m.\n'\
                                   fr'\n'                                                                                                                                         \
                                   fr'\tInsert the snippet from the \[35mclipboard\[0m into \[33m./default.nix\[0m.'                                                      )
                                   ### mind the trailing \n

    clipboard = machine.succeed(f'cat {dotLocal_tmp_path_clT}/clipboard')
    assert_contains_regex(clipboard, 'home.file.".local/bin/templateTestDotLocal".source = ./dotLocal/templateTestDotLocal;')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.bud.template::error:EXISTS"):

    (status, error_response) = machine.execute(f'su - {username} -c     " '\
                                               f'cd {i3_template_path} && '\
                                               f'export DISPLAY=:0     && '\
                                               f'bud template i           '\
                                               f'"'                        )

    assert status == 1, "calling must fail if the directory-to-create already exists"
    assert_contains_regex(error_response, fr"""\tA directory \[31;1malready exists\[0m at \[33m{i3_template_path}/i3\[0m.""")
''

# Local Variables:
# mode: python
# End:
