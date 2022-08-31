{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.zsh"):
    SHELL = machine.succeed(f"su - {username} -c '"                                      \
                            f'echo $SHELL'\
                            "'"                                                         )
    assert_contains(SHELL, r'/run/current-system/sw/bin/zsh')

    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains_line(hm_bin_content, 'zsh')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.zsh::packages"):
    machine.succeed(f'[[ -L {hm_profile_dir}/share/zsh/site-functions/_nix                     ]]') ### nix-zsh-completions
    machine.succeed(f'[[ -L {hm_profile_dir}/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]') ### zsh-autosuggestions
    machine.succeed(f'[[ -L {hm_profile_dir}/share/zsh/site-functions/_flutter                 ]]') ### zsh-completions
    machine.succeed(f'[[ -L {hm_profile_dir}/share/zsh/site-functions/-fast-make-targets       ]]') ### zsh-fast-syntax-highlighting
    machine.succeed(f'[[ -L {hm_profile_dir}/share/zsh-nix-shell/nix-shell.plugin.zsh          ]]') ### zsh-nix-shell




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.zsh::plugins"):
    machine.succeed(f'[[ -s /home/{username}/.config/zsh/plugins/cd-gitroot ]]')
    machine.succeed(f'[[ -s /home/{username}/.config/zsh/plugins/fzf-tab    ]]')
    machine.succeed(f'[[ -s /home/{username}/.config/zsh/plugins/zsh-defer  ]]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.zsh::plugins::autosuggestions"):
    ### WAIT FOR LOGIN
    machine.sleep(2)
    ### CREATE TESTCOMMAND
    machine.send_chars("echo autosuggestionsTest\n")
    ### ENTER FIRST CHAR
    machine.send_key("e")
    ### WAIT FOR SUGGESTION
    machine.sleep(2)
    ### JUMP TO END OF SUGGESTED TESTCOMMAND
    machine.send_key("ctrl-e")
    ### CREATE FILE
    machine.send_chars(f" > /home/{username}/zshAutosuggestionsTest\n")
    # machine.screenshot("SCROTNAME")

    machine.wait_for_file(f"/home/{username}/zshAutosuggestionsTest")
    zshAutosuggestionsTest = machine.succeed(f'cat /home/{username}/zshAutosuggestionsTest')
    assert_contains(zshAutosuggestionsTest, 'autosuggestionsTest')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.zsh::dotDir"):
    machine.succeed(f'[[ -d /home/{username}/.config/zsh ]]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.zsh::dotDir/zshrc.d"):
    machine.succeed(f'[[ -L /home/{username}/.config/zsh/zshrc.d ]]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.zsh::history"):
    machine.wait_for_file(f"/home/{username}/.config/zsh/.zshrc")
    zshrc = machine.succeed(f'cat /home/{username}/.config/zsh/.zshrc')
    assert_contains(zshrc, fr'HISTFILE="/home/{username}/.local/share/zsh/zsh_history"')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.zsh::volatiles"):
    machine.succeed(f'[[ -f /home/{username}/.config/zsh/volatiles/zshenv  ]]')
    machine.succeed(f'[[ -f /home/{username}/.config/zsh/volatiles/aliases ]]')




# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.shell.zsh::docDotLocal"):
    # machine.wait_for_unit("documentation.service")
    # output = machine.wait_until_succeeds('curl localhost:41503/homemanager/shell/')
    # assert_contains(output, "<title>shell - Docs</title>")
''

# Local Variables:
# mode: python
# End:
