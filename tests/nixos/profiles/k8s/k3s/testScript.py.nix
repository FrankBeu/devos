{ ... }:
''
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.k8s.k3s"):
       sw_bin_content = machine.succeed('ls /run/current-system/sw/bin/')
       assert_contains_line(sw_bin_content, 'k3s')
       ### TODO
       # machine.wait_until_succeeds("systemctl status k3s.service | grep 'Active: running'")

''

# Local Variables:
# mode: python
# End:
