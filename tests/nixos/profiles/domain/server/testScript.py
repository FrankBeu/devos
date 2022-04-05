# import re

machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ nixos.profiles.domain.server"):
    machine.wait_for_unit("coredns.service")

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if external dns is available"):

    machine.log('TODO: fix: external dns is available on cli or interacitvely but not via machine.')

    ### TODO: fix
    # output = machine.succeed('drill google.com')
    # assert_contains_regex(output, r"google.com.\t\d+\tIN\tA\t[0-9.]+")
