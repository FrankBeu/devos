machine.wait_for_unit("multi-user.target")
machine.wait_for_unit("documentation.service")

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if GIT is available"):
    machine.succeed('git --version ')

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if GIT-DOCUMENTATION is available"):
    _, doc = machine.systemctl("status documentation.service --no-pager")
    machine.log(doc)

    output = machine.succeed('curl localhost:41503/homemanager/git/')
    assert_contains(output, "<title>git - Docs</title>")
