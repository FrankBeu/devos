{
  ### DISABLE SLEEP
  systemd.targets = {
    hibernate.enable              = false;
    hybrid-sleep.enable           = false;
    sleep.enable                  = false;
    suspend-then-hibernate.enable = false;
    suspend.enable                = false;
  };
}
### TODO doc
### if profile is used; sleep cannot be activated any more
### masks the systemd.target
### useful for servers
### TODO check wake up on network

### hibernate powerbutton
### suspend   keyboard mouse

### TODO for wakeup check
### Force hibernated system to only wake up on powerbutton press / System Administration / Arch Linux Forums
### https://bbs.archlinux.org/viewtopic.php?id=184553
###
### Stop mouse from waking up the computer - Learn - NixOS Discourse
### https://discourse.nixos.org/t/stop-mouse-from-waking-up-the-computer/12539/6
###
### How can I wake it up from suspension and hibernation : NixOS
### https://www.reddit.com/r/NixOS/comments/qfe9yr/how_can_i_wake_it_up_from_suspension_and/
###
### Wake up suspended by hitting external usb keyboard - Learn - NixOS Discourse
### https://discourse.nixos.org/t/wake-up-suspended-by-hitting-external-usb-keyboard/12003
###
### nix-config/usb-wakeup-disable.nix at 3d2aef1418cab766ab744129f4308e1596f1335c · 9999years/nix-config
### https://github.com/9999years/nix-config/blob/3d2aef1418cab766ab744129f4308e1596f1335c/modules/usb-wakeup-disable.nix
###
### nix-config/aquatica.nix at 3d2aef1418cab766ab744129f4308e1596f1335c · 9999years/nix-config
### https://github.com/9999years/nix-config/blob/3d2aef1418cab766ab744129f4308e1596f1335c/hosts/aquatica.nix#L53
