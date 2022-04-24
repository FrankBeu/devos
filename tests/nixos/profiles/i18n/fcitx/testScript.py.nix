{ username }:
''
machine.wait_for_unit("multi-user.target")

### check if fcitx can be started. nixos-test cannot be used in home-test
### in prod fcitx will be started by i3
with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.i18n.fcitx"):
    username = "${username}"

    ### https://github.com/NixOS/nixpkgs/commit/3855e83c49fa2be185c88e56d6c56b40c165b103
    machine.succeed(f"systemctl --machine={username}@.host --user start fcitx5-daemon.service")
    machine.wait_until_succeeds(f"systemctl --machine={username}@.host --user status fcitx5-daemon.service | grep 'Active: active'")
    machine.log("fcitx5 is running")
    machine.succeed(f"systemctl --machine={username}@.host --user stop fcitx5-daemon.service")
    machine.log("fcitx5 is not running anymore")
''


# Local Variables:
# mode: python
# End:

