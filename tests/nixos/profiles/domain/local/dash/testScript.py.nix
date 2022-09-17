{}:
''
machine.wait_for_unit("multi-user.target")
machine.wait_for_unit("traefik.service")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.local.dash"):
    machine.wait_until_succeeds("systemctl status traefik.service | grep 'Active: active'")
    ### TODO extract; implement timeout
    machine.execute("""while [[ "$(curl --location --silent --output /dev/null --write-out \"%{http_code}\" localhost:8080)" != "200" ]]; do sleep 1; done""")

    ### TODO extract; implement timeout
    machine.execute("""while [[ "$(curl --location --silent --output /dev/null --write-out \"%{http_code}\" traefik.local )" != "200" ]]; do sleep 1; done""")
    traefik_dot_local_response = machine.succeed('curl -L traefik.local')
    assert_contains(traefik_dot_local_response, '<meta name=description content="Traefik UI">')

    ### TODO extract; implement timeout
    machine.execute("""while [[ "$(curl --location --silent --output /dev/null --write-out \"%{http_code}\" dash.local )" != "200" ]]; do sleep 1; done""")
    dash_dot_local_response    = machine.succeed('curl -L dash.local')
    assert_contains(dash_dot_local_response,    '<meta name=description content="Traefik UI">')
''

# Local Variables:
# mode: python
# End:
