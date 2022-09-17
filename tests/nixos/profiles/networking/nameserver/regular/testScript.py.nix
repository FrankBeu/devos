{}:
''
machine.wait_for_unit('multi-user.target')


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.networking.nameserver.regular::point_to_localhost"):
    machine.wait_for_file('/etc/resolv.conf')
    resolv_conf = machine.succeed('cat /etc/resolv.conf')
    assert_contains_line(resolv_conf, 'nameserver 127.0.0.1')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.networking.nameserver.regular::nameServer_running"):
    machine.wait_for_unit('coredns.service')
    port_53 = machine.succeed('netstat -upln | grep 53')
    assert_contains(port_53, 'coredns')




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.networking.nameserver.regular::nameServer_configuration"):
    dns_forward_config = machine.succeed("""cat \
                                                `systemctl show coredns --property=ExecStart --no-page | \
                                                  awk '{print $5}'                                     | \
                                                  sed 's/-conf=//'`                                    | \
                                            grep forward""")
    assert_contains(dns_forward_config, 'forward . 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4')
    ### TODO create variable used by implementation and test




# ### TODO works on interactiveTest machine.succeed('drill google.com')
# with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.networking.nameserver.regular::query"):
#     machine.wait_until_succeeds("systemctl status coredns.service | grep 'Active: active'")
#     machine.wait_for_unit('network-online.target')
#     # machine.wait_for_unit('nss-lookup.target')
#     machine.sleep(30)
#     # output = machine.succeed('curl localhost:5353/ready')
#     machine.log(output)
#     output = machine.succeed('drill google.com')
#     # output = machine.wait_until_succeeds('drill google.com')
#     assert_contains_regex(output, r'google.com.\t\d+\tIN\tA\t[0-9.]+')

''

# Local Variables:
# mode: python
# End:
