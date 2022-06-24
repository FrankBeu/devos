{ hmProfileDir, username }:
''
machine.wait_for_unit("graphical.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




### TODO
### home-manager-implementation has changed; relevant??
### test after update https://github.com/nix-community/home-manager/blob/master/modules/config/home-cursor.nix
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.display.cursor"):




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.display.cursor::find-cursor"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains_line(hm_bin_content, 'find-cursor')




### TODO
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.display.cursor::appearance"):
''

# Local Variables:
# mode: python
# End:
