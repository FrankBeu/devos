machine.wait_for_unit("multi-user.target")


### TODO
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.editor.emacs"):
    # # machine.wait_until_succeeds("su nixos -c 'systemctl --user status emacs.service | grep \'Active: active\''")
    # machine.wait_until_succeeds("systemctl --machine=nixos@.host --user status emacs.service | grep 'Active: active'")
    # machine.log("emacsclient is running")

    # ### TODO check behaviour
    # # output = machine.succeed("su nixos -c 'emacsclient -e \'(message \"emacsClient is running\")\''")
    # # assert_contains(output, 'emacsClient is running')

    # ### long running test (>1min)!!

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.editor.emacs::rnix-lsp"):
    output = machine.succeed('ls /run/current-system/sw/bin/')
    assert_contains(output, 'rnix-lsp')
    ### TODO check if rnix-lsp is from flake!?
    ### `{file,ldd} /nix/store/xnshvy6xhxvqf0z41m4k1akfxqba5ga7-rnix-lsp-0.1.0/bin/rnix-lsp` are of no use
