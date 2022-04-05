{ domainName }:
''
with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ nixos.profiles.domain.server"):
    machine.wait_for_unit("coredns.service")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if {stage,dev}.DOMAIN is set via variables"):

    output = machine.succeed('drill stage.${domainName}')
    assert_contains_regex(output, r"${domainName}.\t\d+\tIN\tA\t127.0.0.1")
    # machine.log(output)
    output = machine.succeed('drill dev.${domainName}')
    assert_contains_regex(output, r"${domainName}.\t\d+\tIN\tA\t127.0.0.1")
    # machine.log(output)
''


# Local Variables:
# mode: python
# End:
