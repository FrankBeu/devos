machine.wait_for_unit("multi-user.target")
machine.wait_for_unit("documentation.service")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if GIT is available"):
    ### machine.succeed("git --version") will not work - git is only available as user nixos

    ### working screenshotTest - problematic on integrationTests
    # prepare_console_for_scrot()
    # machine.send_chars("git --version\n")
    # check_golden_scrot("gitVersionTarget.png", "gitVersionActual")
    # restore_console_after_scrot()

    check_screen_text("git status", ["fatal:", "not a git repository"])


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if GIT-DOCUMENTATION is available"):
    _, doc = machine.systemctl("status documentation.service --no-pager")
    machine.log(doc)

    output = machine.succeed('curl localhost:41503/homemanager/git/')
    assert_contains(output, "<title>git - Docs</title>")

    # output = machine.succeed('cat /home/nixos/.docLocal/content/homemanager/git.org')
    # machine.log(print(output))
