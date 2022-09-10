{ hmProfileDir, username }:
''
machine.wait_for_unit("graphical.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'


### TODO variable keybindings
script_base_names = [
  "y", "u", "i",     "o",      "p",
  "h", "j", "k",     "l",      "semicolon",
  "n", "m", "comma", "period", "slash"
];


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.actionButton"):

    machine.succeed(f'[[ -d /home/{username}/DOCUMENTS/PROJECTS/actionButton ]]')
    machine.succeed(f'[[ -d /home/{username}/.config/actionButton            ]]')
    machine.succeed(f'[[ -d /home/{username}/.config/actionButton/EXAMPLES   ]]')
    machine.succeed(f'[[ -d /home/{username}/.config/actionButton/TEMPLATES  ]]')
    machine.succeed(f'[[ -L /home/{username}/.config/actionButton/FUNDUS     ]]')
    for name in script_base_names:
      machine.succeed(f'[[ -e /home/{username}/.config/actionButton/TEMPLATES/{name}.zsh ]]')





with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.actionButton::i3config"):
    machine.wait_for_x()
    ### TODO variable keybindings
    machine.send_key("meta_r-i")
    machine.send_key("meta_r-i")
    machine.wait_until_succeeds(f'[[ -e /home/{username}/actionButtonTestSuccess ]]')




### TODO
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.actionButton::docDotLocal"):
#     machine.wait_for_unit("documentation.service")
#     output = machine.wait_until_succeeds('curl localhost:41503/homemanager/actionbutton/')
#     assert_contains(output, "<title>actionButton - Docs</title>")

''

# Local Variables:
# mode: python
# End:
