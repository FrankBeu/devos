{ username }:
''
machine.wait_for_unit("multi-user.target")

username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.browser.firefox.orgCapture"):
    machine.succeed(f'[[ -s /home/{username}/.local/share/applications/org-protocol.desktop ]]')

    mimeapps = machine.succeed(f'cat /home/{username}/.config/mimeapps.list')
    assert_contains(mimeapps,'x-scheme-handler/org-protocol=org-protocol.desktop')

    xpis = machine.succeed('fd \'.*}.xpi\' -H --full-path /home/' + username + '/.mozilla/extensions/ -x unzip -l {}')
    assert_contains(xpis,'org-mode-unicorn.png')

    manualActions = machine.succeed(f'cat /home/{username}/.manualActions/manualActions.org')
    assert_contains(manualActions,'*** TODO org-protocol')
''

# Local Variables:
# mode: python
# End:
