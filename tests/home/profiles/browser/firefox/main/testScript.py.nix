{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.browser.firefox.main"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains_line(hm_bin_content, 'firefox')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.browser.firefox.main::extensions"):
    extensions = machine.succeed(f'ls -R /home/{username}/.mozilla/extensions')
    assert_contains(extensions, 'metamask')
    assert_contains(extensions, 'uBlock')
    assert_contains(extensions, 'wappalyzer')

    xpis = machine.succeed('fd \'.*}.xpi\' -H --full-path /home/' + username + '/.mozilla/extensions/ -x unzip -l {}')
    assert_contains(xpis,'img/export-as-file.svg') ### not possible: assert_contains(extensions, 'export-tabs-urls-and-titles')

### TODO test behavior
''

# Local Variables:
# mode: python
# End:
