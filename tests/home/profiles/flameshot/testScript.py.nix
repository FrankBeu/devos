{ hmProfileDir, username }:
''
machine.wait_for_unit("graphical.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.flameshot"):
    hm_profile_dir = machine.succeed(f'ls {hm_profile_dir}')
    assert_contains(hm_profile_dir, 'flameshot')
    machine.succeed(f'[[ -s /home/{username}/.config/flameshot/flameshot.ini ]]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.flameshot::keysFlameshot"):
    machine.succeed(f'[[ -s /home/{username}/.local/bin/keysFlameshot ]]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.flameshot::i3config"):
    machine.wait_for_x()
    machine.wait_for_unit("flameshot.service", username)
    ### TODO variable keybindings
    machine.send_key("meta_r-dot")
    machine.send_key("meta_r-l")
    machine.wait_until_succeeds(f'[[ -n "$(ls -A /home/{username}/PICTURES/flameshot/)" ]]')
    ### needed otherwise the test will loop ??
    o = machine.succeed(f'ls /home/{username}/PICTURES/flameshot/')
    machine.log(o)
''

# Local Variables:
# mode: python
# End:
