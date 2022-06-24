{ hmProfileDir, username }:
''
machine.wait_for_unit("graphical.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'
### TODO refactor goldenPath rel to /tmp
### define in default.nix? be careful hosts/HOSTNAME/default.nix
golden_path    = "tests.home.profiles.rofi/golden"


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.rofi"):
    hm_bin_content = machine.succeed(f'ls {hm_profile_dir}/bin')
    assert_contains_line(hm_bin_content, 'rofi')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.rofi::config"):
    machine.succeed(f'[[ -s /home/{username}/.config/rofi/config.rasi ]]')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.rofi::i3config"):
    machine.wait_for_x()
    machine.wait_for_file( f"/home/{username}/.Xauthority")
    machine.succeed(f"xauth merge ~{username}/.Xauthority")
    machine.fail(f"pgrep -u {username} gvim")
    machine.send_key("meta_r-comma")
    machine.send_key("meta_r-comma")
    machine.sleep(2)
    machine.wait_for_window(r"rofi")
    machine.send_chars("gvim\n")
    machine.wait_until_succeeds(f"pgrep -u {username} gvim")
    machine.succeed("pkill vim")
''

# Local Variables:
# mode: python
# End:
