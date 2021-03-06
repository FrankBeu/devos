machine.wait_for_unit("multi-user.target")

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.local::Check if *.local is available"):
    machine.wait_for_unit("coredns.service")
    output = machine.succeed('drill @127.0.0.1 local.')
    assert_contains(output, "local.	0	IN	A	127.0.0.1")
    # machine.log(output)


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.local::Check if doc.local is available"):
    machine.wait_for_unit("coredns.service")
    output = machine.succeed('drill doc.local.')
    assert_contains(output, "doc.local.	0	IN	A	127.0.0.1")
    # machine.log(output)


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.local::Check if documentation is served at doc.local"):
    # _, doc = machine.systemctl("status documentation.service --no-pager")
    # machine.log(doc)

    output = machine.wait_until_succeeds('curl doc.local')
    assert_contains(output, "<title>homepage - Docs</title>")
    # machine.log(output)


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.local::Check if DOMAIN-DOCUMENTATION is available"):
    # _, doc = machine.systemctl("status documentation.service --no-pager")
    # machine.log(doc)

    output = machine.wait_until_succeeds('curl localhost:41503/system/domain/')
    assert_contains(output, "<title>domain - Docs</title>")
    # machine.log(output)
