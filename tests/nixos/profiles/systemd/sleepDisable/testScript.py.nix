{ hmProfileDir, username }:
''
machine.wait_for_unit("multi-user.target")

hm_profile_dir = '${hmProfileDir}'
username       = '${username}'
dev_null       = "/dev/null"




### TODO how to test a sleeping computer??
with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.systemd.sleepDisable"):
    machine.succeed(f'[[ "$(readlink /etc/systemd/system/hibernate.target)"              = "{dev_null}" ]]')
    machine.succeed(f'[[ "$(readlink /etc/systemd/system/hybrid-sleep.target)"           = "{dev_null}" ]]')
    machine.succeed(f'[[ "$(readlink /etc/systemd/system/sleep.target)"                  = "{dev_null}" ]]')
    machine.succeed(f'[[ "$(readlink /etc/systemd/system/suspend-then-hibernate.target)" = "{dev_null}" ]]')
    machine.succeed(f'[[ "$(readlink /etc/systemd/system/suspend.target)"                = "{dev_null}" ]]')
''

# Local Variables:
# mode: python
# End:
