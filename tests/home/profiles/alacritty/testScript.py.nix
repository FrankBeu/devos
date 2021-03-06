{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.alacritty"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains_line(hm_bin_content, 'alacritty')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.alacritty::config"):
    machine.wait_for_file("/home/nixos/.config/alacritty")
    output = machine.succeed('ls /home/nixos/.config/alacritty')
    assert_contains(output, 'alacritty.yml')
    # assert_contains(output, 'themes')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.alacritty::check-{preamble,config}-alignment"):
    machine.wait_for_file("/home/nixos/.config/alacritty/alacritty.yml")
    output = machine.succeed('cat /home/nixos/.config/alacritty/alacritty.yml')
    assert_contains_regex(output, r'^### nixVariableAnchorsEnd')
    assert_contains_regex(output, r'^### yamlAnchorsContinuation')




### TODO: config-tests; check if alacritty can be executed with loaded config: golden: no error message
###       check if ` alacritty --ref-test` is usefull
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  config-tests"):
    ###
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  regex-tests"):
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  emacsclient"):
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  nixLog"):
''
### REGEXFUNDUS
### nix-repl:
### «lambda @ /nix/store/nvkkhnbjmghwl4d2sbr4s8qpv5fg5i9k-source/src/importers.nix:129:29»
### editorconfig:
### home/profiles/alacritty/OLD/alacritty/themes/dracula.nix:
### nix Error:
### at /nix/store/kcp28ljgay9cvkawdigyw4b7rlb31w6m-source/tests/nixos/profiles/display/i3/testScript.py.nix:2:1:

# nixLogTest: write exampleFile showing path to a predefined nix-log; insert into store; get path; check if can be opened




# Local Variables:
# mode: python
# End:
