{}:
''
machine.wait_for_unit("multi-user.target")
machine.wait_for_unit("traefik.service")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.local.domain"):
    machine.wait_for_unit("coredns.service")
    output = machine.succeed('drill @127.0.0.1 local.')
    assert_contains(output, "local.	0	IN	A	127.0.0.1")




### TODO
with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.local.domain::documentation"):
    machine.wait_until_succeeds("systemctl status documentation.service | grep 'Active: active'")
    machine.execute("""while [[ "$(curl --location --silent --output /dev/null --write-out \"%{http_code}\" localhost:41503/system/domain/)" != "200" ]]; do sleep 1; done""")
    output = machine.wait_until_succeeds('curl localhost:41503/system/domain/')
    assert_contains(output, "<title>domain - Docs</title>")
''

# Local Variables:
# mode: python
# End:
