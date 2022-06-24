{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.prompts.starship"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains_line(hm_bin_content, 'starship')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.prompts.starship::config"):
    machine.wait_for_file(f"/home/{username}/.config/zsh/.zshrc")
    zshrc = machine.succeed(f'cat /home/{username}/.config/zsh/.zshrc')
    assert_contains(zshrc, r'eval "$(/etc/profiles/per-user/test/bin/starship init zsh)"')




### TODO check appearance
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.prompts.starship::appearance"):
''

# Local Variables:
# mode: python
# End:
