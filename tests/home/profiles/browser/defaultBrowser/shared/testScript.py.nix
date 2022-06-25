{ defaultBrowser, username }:
''
machine.wait_for_unit("multi-user.target")

username = "${username}"

browser_default = "${defaultBrowser}"

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.browser.defaultBrowser"):
    mimeapps_list = machine.succeed(f"cat /home/{username}/.config/mimeapps.list")
    assert_contains(mimeapps_list, browser_default)



### TODO test DEFAULT_BROWSER
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.browser.defaultBrowser::env"):
''

# Local Variables:
# mode: python
# End:
