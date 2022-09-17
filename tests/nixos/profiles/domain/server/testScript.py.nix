{}:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ nixos.profiles.domain.server::traefik"):
    machine.wait_for_unit("traefik.service")
    machine.wait_until_succeeds("systemctl status traefik.service | grep 'Active: active'")




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ nixos.profiles.domain.server::dashboard"):
    ### TODO extract; implement timeout
    machine.execute("""while [[ "$(curl --location --silent --output /dev/null --write-out \"%{http_code}\" localhost:8080)" != "200" ]]; do sleep 1; done""")

    dashboard_response = machine.succeed('curl -L localhost:8080')
    assert_contains(dashboard_response, '<meta name=description content="Traefik UI">')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ nixos.profiles.domain.server::logDir"):
    machine.succeed('[[ -f /var/log/traefik/traefikAccess.log ]]')
''



# Local Variables:
# mode: python
# End:
