{ version }:
''
machine.wait_for_unit("multi-user.target")

version         = "${version}"
starshipVersion = version.strip('v')



with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.shell.prompts.starship"):
    sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(sw_bin_content, 'starship')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.shell.prompts.starship::config"):
    machine.wait_for_file("/etc/profile")
    profile = machine.succeed("cat /etc/profile")
    assert_contains(profile, 'export STARSHIP_CONFIG=/etc/starship/starship.toml')


    machine.succeed('[[ -L /etc/starship/starship.toml ]]')


    machine.wait_for_file("/etc/bashrc")
    bashrc = machine.succeed("cat /etc/bashrc")
    assert_contains_regex(bashrc, r'eval "\$\(/nix/store/.*-starship-v.*/bin/starship init bash\)"')


    machine.wait_for_file("/etc/zshrc")
    zshrc = machine.succeed("cat /etc/zshrc")
    assert_contains_regex(zshrc, r'eval "\$\(/nix/store/.*-starship-v.*/bin/starship init zsh\)"')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.shell.prompts.starship::version"):
    version = machine.succeed("starship --version")
    assert_contains(version, f'{starshipVersion}')




### TODO check appearance
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.prompts.starship::appearance"):
''

# Local Variables:
# mode: python
# End:
