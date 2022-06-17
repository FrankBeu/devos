machine.wait_for_unit("multi-user.target")

# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if DOCUMENTATION-SERVICE is available"):
with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.services.documentation"):
    machine.wait_for_unit("documentation.service")

    homepage = machine.wait_until_succeeds('curl localhost:41503')
    assert_contains(homepage, "<title>homepage - Docs</title>")

    doc = machine.wait_until_succeeds('curl localhost:41503/structural/doc/')
    assert_contains(doc, "<title>doc - Docs</title>")


# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.services.documentation::Check if COLORS are set according to theme"):
#     colors = machine.succeed("cat /etc/docLocal/themes/theme/src/colors.scss")
#     machine.log(colors)
#     machine.succeed("diff /etc/docLocal/themes/theme/src/colors.scss{,.TEST}")
