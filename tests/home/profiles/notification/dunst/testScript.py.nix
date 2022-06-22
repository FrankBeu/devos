{ hmProfileDir, username }:
''
machine.wait_for_unit("graphical.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'
### TODO refactor goldenPath rel to /tmp
### define in default.nix? be careful hosts/HOSTNAME/default.nix
golden_path    = "tests.home.profiles.notification.dunst/golden"


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.notification.dunst"):
    machine.wait_for_x()
    machine.wait_until_succeeds(f"systemctl --machine={username}@.host --user status dunst.service | grep 'Loaded: loaded'")




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.notification.dunst::dunstrc"):
    machine.succeed(f'[[ -s /home/{username}/.config/dunst/dunstrc ]]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.notification.dunst::notify-send"):
    hm_profile_dir = machine.succeed(f'ls {hm_profile_dir}')
    assert_contains_line(hm_profile_dir, 'dunstify')
    assert_contains_line(hm_profile_dir, 'notify-send')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.notification.dunst::i3config"):
    machine.sleep(1)
    machine.send_key("ctrl") ### DO NOT SHOW TOP-BAR
    machine.sleep(1)
    ### TODO refactor goldenPath -> funcLocal??
    check_golden_scrot(os.path.join(golden_path,"TARGET_1_noMessage.png"), "1_noMessage")

    ### WORKING BUT WITH VERSION NUMBER - NOT SUITABLE FOR GOLDENSCROTS
    # machine.send_key("meta_r-m")
    # machine.send_key("meta_r-u")
    ### WILL DISPLAY A NON INTERACTIVE MESSAGE
    # machine.succeed(f'su - {username} -c " '          \
                    # f'dunstify -u low TEST-MESSAGE\n' \
                    # f'"'                              )

    ### SWITCH TO OTHER WORKSPACE IN ORDER TO SEND A MESSAGE
    machine.send_key("meta_r-r")
    ### OPEN TERMINAL
    machine.send_key("meta_r-esc")
    machine.sleep(1)
    machine.send_chars("dunstify -u low TEST-MESSAGE\n")
    ### BACK TO SCROT-WORKSPACE
    machine.send_key("meta_r-tab")
    machine.sleep(1)
    check_golden_scrot(os.path.join(golden_path,"TARGET_2_message.png"), "2_message")
    machine.send_key("meta_r-m")
    machine.send_key("meta_r-semicolon")
    machine.sleep(1)
    check_golden_scrot(os.path.join(golden_path,"TARGET_3_noMessage.png"), "3_noMessage")
''

# Local Variables:
# mode: python
# End:
