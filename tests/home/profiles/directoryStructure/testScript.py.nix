{ username }:
''
machine.wait_for_unit("multi-user.target")

username = "${username}"




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.directoryStructure"):
      machine.succeed(f"[[ -d /home/{username}/AKTUELLES           ]]")
      machine.succeed(f"[[ -d /home/{username}/ARCHIVES            ]]")
      machine.succeed(f"[[ -d /home/{username}/BAK                 ]]")
      machine.succeed(f"[[ -d /home/{username}/MEDIA               ]]")
      machine.succeed(f"[[ -d /home/{username}/MEDIA/ANDROID       ]]")
      machine.succeed(f"[[ -d /home/{username}/MEDIA/BAK           ]]")  ### +SUBDIRS are created in cf. ../backup/kopia/default.nix:16:73
      machine.succeed(f"[[ -d /home/{username}/MEDIA/CCUSB         ]]")
      machine.succeed(f"[[ -d /home/{username}/MEDIA/EXTERN        ]]")
      machine.succeed(f"[[ -d /home/{username}/MEDIA/PIC           ]]")
      machine.succeed(f"[[ -d /home/{username}/MUSIC               ]]")
      machine.succeed(f"[[ -d /home/{username}/NOTES               ]]")
      machine.succeed(f"[[ -d /home/{username}/NOW                 ]]")
      machine.succeed(f"[[ -d /home/{username}/PICTURES            ]]")
      machine.succeed(f"[[ -d /home/{username}/PICTURES/flameshot  ]]")
      machine.succeed(f"[[ -d /home/{username}/ROUTINES            ]]")
      machine.succeed(f"[[ -d /home/{username}/SRC                 ]]")
      machine.succeed(f"[[ -d /home/{username}/SRC/registeredRepos ]]")
      machine.succeed(f"[[ -d /home/{username}/SRC/GITEA           ]]")
      machine.succeed(f"[[ -d /home/{username}/SRC/GITHUB          ]]")
      machine.succeed(f"[[ -d /home/{username}/TMP                 ]]")
      machine.succeed(f"[[ -d /home/{username}/UNBAKED             ]]")  ### unBAKed and unBackUped
      machine.succeed(f"[[ -d /home/{username}/UNSORTED            ]]")
      machine.succeed(f"[[ -d /home/{username}/VIDEOS              ]]")
      machine.succeed(f"[[ -d /home/{username}/VIDEOS/OBS          ]]")
      machine.succeed(f"[[ -d /home/{username}/VIRTUALISATION      ]]")  ### TODO create config for VBox




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.directoryStructure::dotLocal"):
        machine.succeed(f"[[ -s /home/{username}/.local/bin/registerRepo ]]")




with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.directoryStructure::i3config"):
    machine.wait_for_x()
    ranger = machine.succeed("procs ranger --no-header")
    assert_lacks(ranger, "ranger")
    machine.send_key("meta_r-slash")
    machine.send_key("meta_r-j")
    machine.wait_until_succeeds(f"pgrep -u {username} ranger")
''

# Local Variables:
# mode: python
# End:
