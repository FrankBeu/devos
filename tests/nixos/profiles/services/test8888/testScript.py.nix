{}:
''
machine.wait_for_unit("multi-user.target")
machine.wait_for_unit("test8888.service")

expected  = {"host": "127.0.0.1:8888", "port": "8888", "uri": "/"}

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.services.test8888"):
    module_name = 'json'
    import_via_globals(module_name)
    json = globals()[module_name]

    actual = json.loads(
        machine.succeed(
            "curl http://127.0.0.1:8888"
        )
    )

    del actual["header"]

    pprint(expected)
    pprint(actual)

    assert expected == actual, f"\n   got: {actual}\nwanted: {expected}\n"
''

# Local Variables:
# mode: python
# End:
