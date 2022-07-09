{ ... }:
''
machine.wait_for_unit("multi-user.target")




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.shell.prompts.powerline"):
    sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains_line(sw_bin_content, 'powerline-go')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.shell.prompts.powerline::config"):
    machine.wait_for_file("/etc/zshrc")
    zshrc = machine.succeed('cat /etc/zshrc')
    assert_contains(zshrc, r'function powerline_precmd()')




### TODO check appearance
### TODO fonts
### TODO check if overlay is applied
###      manual: built w/o overlay; testPrebuild; `powerline-go`; compare
###              built w/  overlay; testPrebuild; `powerline-go`; compare
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.shell.prompts.powerline::appearance"):
''

# Local Variables:
# mode: python
# End:
