{ username }:
''
# machine.wait_for_unit("multi-user.target")
machine.wait_for_unit("graphical.target")

username    = "${username}"

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.i18n.fcitx configuration"):
    data_path   = f"/home/{username}/.local/share/fcitx5"
    config_path = f"/home/{username}/.config/fcitx5"

    machine.wait_for_file(data_path)
    machine.wait_for_file(config_path)

    machine.succeed(f'[[ -f {data_path}/data/QuickPhrase.mb ]]')
    machine.succeed(f'[[ -d {data_path}/themes/nixColor     ]]')

    machine.succeed(f'[[ -f {config_path}/config            ]]')
    machine.succeed(f'[[ -f {config_path}/profile           ]]')
    machine.succeed(f'[[ -d {config_path}/conf              ]]')


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.i18n.fcitx execution"):
    machine.wait_until_succeeds(f"systemctl --machine={username}@.host --user status fcitx5-daemon.service | grep 'Active: active'")
    machine.log("fcitx5 is running")

    ### DEBUG
    # output = machine.succeed('cat /home/nixos/.local/share/fcitx5/themes/nixColor/theme.conf')
    # machine.log(output)

### TODO needs HW-Accelleration
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.i18n.fcitx theme"):
#     ### TODO minimize duration
#     machine.sleep(5)

#     ### open terminal
#     machine.send_key("meta_r-spc")

#     machine.sleep(5)

#     ### unicode
#     machine.send_key("ctrl-shift-u")
#     machine.send_chars("long right arrow")
#     machine.sleep(20)
#     for n in range(2):
#         machine.send_key("tab")
#     machine.sleep(3)
#     # check_golden_scrot("fcitxThemeTarget.png", "fcitxThemeActual", debug=True)
#     check_golden_scrot("fcitxThemeTarget.png", "fcitxThemeActual")


#     ### TODO mozc needs HW-Accelleration
#     # ### switch to hiragana
#     # machine.send_key("ctrl-alt-shift-spc")

#     # machine.sleep(5)

#     # ### enter
#     # machine.send_chars("seiko")
#     # machine.send_key("tab")

#     # check_golden_scrot("fcitxThemeTarget.png", "fcitxThemeActual")

''


# Local Variables:
# mode: python
# End:
