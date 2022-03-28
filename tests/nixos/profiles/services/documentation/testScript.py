machine.wait_for_unit("multi-user.target")

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if DOCUMENTATION-SERVICE is available"):
    # _, jobs = machine.systemctl("list-units --no-pager")
    # machine.log(jobs)

    # _, doc = machine.systemctl("status documentation.service --no-pager")
    # machine.log(doc)

    output = machine.succeed('curl localhost:41503')
    assert_contains(output, "<title>home - Docs</title>")

    output = machine.succeed('curl localhost:41503/global/documentation/')
    assert_contains(output, "<title>documentation - Docs</title>")


# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if COLORS are set according to theme"):
#     colors = machine.succeed("cat /etc/docLocal/themes/theme/src/colors.scss")
#     machine.log(colors)
#     machine.succeed("diff /etc/docLocal/themes/theme/src/colors.scss{,.TEST}")
