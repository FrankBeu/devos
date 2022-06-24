{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.fuzzy.skim"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains(hm_bin_content, 'sk')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.fuzzy.skim"):
    machine.wait_for_file(f"/home/{username}/.config/zsh/.zshrc")
    zshrc = machine.succeed(f'cat /home/{username}/.config/zsh/.zshrc')
    # machine.log(zshrc)
    assert_contains(zshrc, 'share/skim/completion.zsh')
    assert_contains(zshrc, 'share/skim/key-bindings.zsh')

### TODO behavior needs display & passthrou
''

# Local Variables:
# mode: python
# End:
