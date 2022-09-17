{ ports
, subDomain
, variant
}:
''
port_http  = "${toString ports.http}"
port_https = "${toString ports.https}"
sub_domain = "${subDomain}"
variant    = "${variant}"

schemes  = ["http", "https"]
# schemes  = ["https"]
expected = {
  "http":  {"host": sub_domain, "port": port_http,  "uri": "/"},
  "https": {"host": sub_domain, "port": port_https, "uri": "/"}
  }

machine.wait_for_unit("multi-user.target")
machine.wait_for_unit("coredns.service")
for scheme in schemes:
  machine.wait_for_unit(f"domainTestServer-{variant}-{scheme}.service")


with subtest(f"▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.variable.environment.{variant}::DNS"):
    output = machine.succeed(f'drill {sub_domain}')
    assert_contains_regex(output, rf'{sub_domain}.\t\d+\tIN\tA\t127.0.0.1')

for scheme in schemes:
  with subtest(f"▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.variable.environment.{variant}.{scheme}::proxy"):
      ### TODO extract; implement timeout
      machine.execute(f"""while [[ "$(curl --location --silent --output /dev/null --write-out \"%{{http_code}}\" {scheme}://{sub_domain} )" != "201" ]]; do sleep 1; done""")
      module_name = 'json'
      import_via_globals(module_name)
      json = globals()[module_name]

      actual = json.loads(
          machine.succeed(
              f"curl {scheme}://{sub_domain}"
          )

      )

      # del actual["header"]

      # pprint(expected[scheme])
      # pprint(actual)

      assert expected[scheme] == actual, f"\n   got: {actual}\nwanted: {expected[scheme]}\n"
''


# Local Variables:
# mode: python
# End:
