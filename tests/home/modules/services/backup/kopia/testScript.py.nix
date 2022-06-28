{ username }:
''
machine.wait_for_unit("multi-user.target")

username       = '${username}'


### TODO create test suitable for host and standalone
### TODO loop over all jobs
### TODO check result
with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.modules.services.backup.kopia"):
    machine.wait_for_file(f"/home/{username}/.config/systemd/user/kopia-TEST.service")
    machine.wait_for_file(f"/home/{username}/.config/systemd/user/kopia-TEST.timer")
    service_file = machine.succeed(f'cat /home/{username}/.config/systemd/user/kopia-TEST.service')
    timer_file   = machine.succeed(f'cat /home/{username}/.config/systemd/user/kopia-TEST.timer')


    assert_contains(      service_file,  '[Service]')
    assert_contains(      service_file,  'CPUSchedulingPolicy=idle')
    assert_contains(      service_file,  'EnvironmentFile=/run/secrets/kopia/TEST/environmentFile')
    assert_contains_regex(service_file, f"ExecStart=/nix/store/.*/bin/kopia snap create '/home/{username}/test'")
    assert_contains_regex(service_file,  'ExecStartPre=/nix/store/.*/bin/kopia repository connect filesystem --path /home/test/TEST')
    assert_contains_regex(service_file,  'ExecStop=/nix/store/.*/bin/kopia repository disconnect')
    assert_contains(      service_file,  'IOSchedulingClass=idle')
    assert_contains(      service_file,  'Restart=on-failure')
    assert_contains(      service_file,  'RestartSec=1m')
    assert_contains(      service_file,  'Type=oneshot')
    assert_contains(      service_file,  '[Unit]')
    assert_contains(      service_file,  'Description=kopia-backup-job: TEST')
    assert_contains(      service_file,  'StartLimitIntervalSec=0')


    assert_contains(timer_file, '[Install]')
    assert_contains(timer_file, 'WantedBy=timers.target')
    assert_contains(timer_file, '[Timer]')
    assert_contains(timer_file, 'OnCalendar=18:00')
    assert_contains(timer_file, 'Persistent=true')
    assert_contains(timer_file, 'RandomizedDelaySec=1h')
    assert_contains(timer_file, 'Unit=kopia-TEST.service')
    assert_contains(timer_file, '[Unit]')
    assert_contains(timer_file, 'Description=Kopia periodic snapshotting - TEST')


    timer_systemd = machine.succeed(f'systemctl --user --machine={username}@.host --no-pager -- list-timers')
    assert_contains(timer_systemd, 'kopia-TEST.timer'  )
    assert_contains(timer_systemd, 'kopia-TEST.service')
''
# Local Variables:
# mode: python
# End:
