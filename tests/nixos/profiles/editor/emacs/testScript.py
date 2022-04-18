machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.editor.emacs"):
    # machine.wait_until_succeeds("su nixos -c 'systemctl --user status emacs.service | grep \'Active: active\''")
    machine.wait_until_succeeds("systemctl --machine=nixos@.host --user status emacs.service | grep 'Active: active'")
    machine.log("emacsclient is running")

    ### TODO check behaviour
    # output = machine.succeed("su nixos -c 'emacsclient -e \'(message \"emacsClient is running\")\''")
    # assert_contains(output, 'emacsClient is running')

    ### long running test (>1min)!!







