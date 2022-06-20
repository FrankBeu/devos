{ username }:
''
machine.wait_for_unit("multi-user.target")

username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.browser.firefox.tridactyl"):
  machine.succeed(f"[[ -s /home/{username}/.local/share/tridactyl/native_main.py          ]]")
  machine.succeed(f"[[ -s /home/{username}/.mozilla/native-messaging-hosts/tridactyl.json ]]")
  machine.succeed(f"[[ -s /home/{username}/.local/bin/trili                               ]]")
  machine.succeed(f"[[ -s /home/{username}/.local/bin/trihi                               ]]")
  machine.succeed(f"[[ -s /home/{username}/.config/tridactyl/tridactylrc                  ]]")
  machine.succeed(f"[[ -s /home/{username}/.config/tridactyl/themes/mytheme.css           ]]")



with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.browser.firefox.tridactyl::extension"):
    extensions = machine.succeed(f'ls -R /home/{username}/.mozilla/extensions')
    assert_contains(extensions, 'tridactyl')

### TODO test behavior
''

# Local Variables:
# mode: python
# End:
