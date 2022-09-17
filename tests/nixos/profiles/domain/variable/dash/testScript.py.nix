{ domain
, hostName
}:
''
machine.wait_for_unit("multi-user.target")
machine.wait_for_unit("traefik.service")

host_dot_domain = "${hostName}.${domain}"




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.variable.dash"):
    machine.wait_until_succeeds("systemctl status traefik.service | grep 'Active: active'")
    ### TODO extract; implement timeout
    machine.execute("""while [[ "$(curl --location --silent --output /dev/null --write-out \"%{http_code}\" localhost:8080)" != "200" ]]; do sleep 1; done""")

    ### TODO extract; implement timeout
    machine.execute(f"""while [[ "$(curl --location --silent --output /dev/null --write-out \"%{{http_code}}\" traefik.{host_dot_domain} )" != "200" ]]; do sleep 1; done""")
    traefik_dot_host_dot_domain_response = machine.succeed(f'curl -L traefik.{host_dot_domain}')
    assert_contains(traefik_dot_host_dot_domain_response, '<meta name=description content="Traefik UI">')

    ### TODO extract; implement timeout
    machine.execute(f"""while [[ "$(curl --location --silent --output /dev/null --write-out \"%{{http_code}}\" dash.{host_dot_domain} )" != "200" ]]; do sleep 1; done""")
    dash_dot_host_dot_domain_response    = machine.succeed(f'curl -L dash.{host_dot_domain}')
    assert_contains(dash_dot_host_dot_domain_response,    '<meta name=description content="Traefik UI">')
''

# Local Variables:
# mode: python
# End:
