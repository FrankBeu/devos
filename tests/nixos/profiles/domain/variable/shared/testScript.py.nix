{ port
, subDomain
, variant
}:
''
port       = "${toString port}"
sub_domain = "${subDomain}"
variant    = "${variant}"

expected  = {"host": sub_domain, "port": port, "uri": "/"}

machine.wait_for_unit("multi-user.target")
machine.wait_for_unit("coredns.service")
machine.wait_for_unit(f"domainTestServer-{variant}.service")


with subtest(f"▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.variable.{variant}::DNS"):
    output = machine.succeed(f'drill {sub_domain}')
    assert_contains_regex(output, rf'{sub_domain}.\t\d+\tIN\tA\t127.0.0.1')


with subtest(f"▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.domain.variable.{variant}::proxy"):
    module_name = 'json'
    import_via_globals(module_name)
    json = globals()[module_name]

    ### TODO dynamic protocol
    actual = json.loads(
        machine.succeed(
            f"curl http://{sub_domain}"
        )
    )

    del actual["header"]

    # pprint(expected)
    # pprint(actual)

    assert expected == actual, f"\n   got: {actual}\nwanted: {expected}\n"
''


# Local Variables:
# mode: python
# End:
