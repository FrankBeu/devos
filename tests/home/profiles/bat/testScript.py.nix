{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir  = '${hmProfileDir}'
username        = '${username}'
bat_working_dir = '/tmp/tests.home.profiles.bat'

test_file_path_TARGET = os.path.join(bat_working_dir, 'golden', 'testFileTARGET')
test_file_path_ACTUAL = os.path.join(bat_working_dir, 'testFileACTUAL')



with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.bat::config"):
    machine.succeed(f'[[ -f /home/{username}/.config/bat/config ]]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.bat::docDotLocal"):
    machine.succeed(f'[[ -f /home/{username}/.docLocal/content/homemanager/bat.org ]]')
    ### TODO 404???
    # machine.sleep(15)
    # machine.wait_for_unit("documentation.service")
    # output = machine.wait_until_succeeds('curl localhost:41503/homemanager/bat/')
    # assert_contains(output, "<title>bat - Docs</title>")




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.bat::cache"):
    machine.succeed(f'su - {username} -c    " '                                                                \
                    f'cd {bat_working_dir} && '                                                                \
                    f'bat  --color always --plain ./testFileSource.battestsyntax > {test_file_path_ACTUAL} && '\
                    f'diff {test_file_path_TARGET} {test_file_path_ACTUAL}'                                    \
                    f'"'                                                                                       )
''

# Local Variables:
# mode: python
# End:
