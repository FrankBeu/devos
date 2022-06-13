{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.dotLocal"):
        dot_local = machine.succeed("ls /home/${username}/.local/")
        assert_contains(dot_local, 'bin'  )
        assert_contains(dot_local, 'share')
        assert_contains(dot_local, 'state')

### TODO path is not set in VM
# https://github.com/nix-community/home-manager/blob/master/modules/home-environment.nix#blob-path
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.dotLocal::path"):
#         path = machine.succeed("su ${username} -c 'echo ''${PATH}'")
#         assert_contains(path, ':/home/${username}/.local/bin:'  )

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.dotLocal::packages"):
        hm_profile_dir = machine.succeed("ls ${hmProfileDir}")
        assert_contains(hm_profile_dir, 'pandoc')

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.dotLocal::documentation"):
        ### TODO rename .doclocal -> .docDotLocal
        doc_dot_local = machine.succeed("ls /home/${username}/.docLocal/content/homemanager")
        assert_contains(doc_dot_local, 'dotlocal.org'  )
        ### TODO to catch errors in header: check if page is available


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.dotLocal::share"):
        shellColorDefninitions = machine.succeed("ls /home/${username}/.local/share")
        assert_contains(shellColorDefninitions, 'shellColorDefinitions')

        styles = machine.succeed("ls /home/${username}/.local/share/styles")
        assert_contains(styles, 'styles.css')

        nixify = machine.succeed("ls /home/${username}/.local/share")
        assert_contains(nixify, 'nixify')


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.dotLocal::funcDoc"):
        ### check if each file in dotLocal/bin has the required header
        ### always use `machine.log(print(<CONTENT>))`

        ### get all filenames from bin
        filename_string = machine.succeed("ls /home/${username}/.local/bin | head -c -1") ### strip trailing newline
        filenames = filename_string.split("\n")
        # filenames = [ "f1" ]
        dotLocal_location = "/home/${username}/.local/bin"

        for filename in filenames:
            ensure_dotLocal_header(filename, dotLocal_location)
''


# Local Variables:
# mode: python
# End:
