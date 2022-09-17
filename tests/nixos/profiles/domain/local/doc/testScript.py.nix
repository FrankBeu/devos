{}:
''
machine.wait_for_unit("multi-user.target")
machine.wait_for_unit("traefik.service")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.local.doc"):
    machine.wait_for_unit("coredns.service")
    output = machine.succeed('drill doc.local.')
    assert_contains(output, "doc.local.	0	IN	A	127.0.0.1")




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.local.doc::documentation"):
    machine.wait_until_succeeds("systemctl status documentation.service | grep 'Active: active'")
    ### TODO extract; implement timeout
    machine.execute("""while [[ "$(curl --location --silent --output /dev/null --write-out \"%{http_code}\" doc.local )" != "200" ]]; do sleep 1; done""")
    output = machine.wait_until_succeeds('curl doc.local')
    assert_contains(output, "<title>homepage - Docs</title>")
''

# Local Variables:
# mode: python
# End:
