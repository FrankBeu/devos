{ domain
, hostName
}:
''
machine.wait_for_unit("multi-user.target")
machine.wait_for_unit("traefik.service")

domain   = "${domain}"
hostname = "${hostName}"




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.variable.hostname"):
    machine.wait_for_unit("coredns.service")
    output = machine.succeed(f'drill @127.0.0.1 {hostname}.{domain}')
    assert_contains(output, f'{hostname}.{domain}.	0	IN	A	127.0.0.1')
''

# Local Variables:
# mode: python
# End:
