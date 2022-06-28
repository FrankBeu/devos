{ config, nixosConfig }:
let
  inherit (config.home)                 username;
  inherit (nixosConfig.networking) hostName;
  inherit (nixosConfig.bud)            localFlakeClone;
in
''
** kopia
*** setup
**** create
***** device-mounts
for repositories \\
in =${localFlakeClone}/hosts/${hostName}/system/misc/mountsBackup/default.nix= \\
create =sys{m,u}=-aliases
***** kopia-mounts
for restoration \\
in =./default.nix=
***** passwords
#+BEGIN_SRC shell :results none
gopass generate kopia/HOME/INTERNAL 64
gopass generate kopia/HOME/EXTERNAL 64
gopass generate kopia/HOME/REMOTE   64
gopass generate kopia/K8S/INTERNAL  64
gopass generate kopia/K8S/EXTERNAL  64
gopass generate kopia/K8S/REMOTE    64
gopass generate kopia/SAFE          64
#+END_SRC
***** repositories
****** mount device
****** chown
#+BEGIN_SRC shell :results drawer
  sudo chown -R frank:users /srv/KOPIA
#+END_SRC

****** create repo with gopass repo
#+BEGIN_SRC shell :results drawer
  kopia repository create filesystem --path /srv/KOPIA/SAFE
  kopia repository create filesystem --path /srv/

#+END_SRC

****** create BAK of /home/frank/.config/kopia
****** remove /home/frank/.config/kopia/repository.config.update-info.json
to disable autoupdate
****** rename
#+BEGIN_SRC shell :results drawer
mv /home/frank/.config/kopia/{repository,SAFE}.config
mv /home/frank/.config/kopia/{repository,SAFE}.config.kopia-password
#+END_SRC
***** connect to repository
#+BEGIN_SRC shell :results drawer
export KOPIA_CHECK_FOR_UPDATES=false;
export KOPIA_CONFIG_PATH=~/.config/kopia/SAFE.config;
KOPIA_PASSWORD=$(gopsc kopia/SAFE &>/dev/null; xsel -ob) kopia repo connect from-config --file ''${KOPIA_CONFIG_PATH}
#+END_SRC
***** create snap
#+BEGIN_SRC shell :results drawer
  kopia snapshot create ~/.SAFE
#+END_SRC
***** TODO ?? create =~/.SAFE=
700
note ownership of /etc/ssh
copy everything to safe (including chowned =/etc/ssh/=)
with script UPDATESAFE
need place for all keys
makes ownership easier
links are saved as links
***** persist password and repository to sops
in =${localFlakeClone}/secrets/users/${username}/${hostName}/secret.nix=
***** create job
in =${localFlakeClone}/hosts/${hostName}/home/${username}.nix=
***** mount
#+BEGIN_SRC shell :results drawer
sdv kopia mount all ~/MEDIA/BAK/KOPIA/SAFE
#+END_SRC
***** erros
****** message
#+BEGIN_EXAMPLE
kop mount all ~/MEDIA/BAK/KOPIA/SAFE
/run/wrappers/bin/fusermount: failed to access mountpoint /home/frank/MEDIA/BAK/KOPIA/SAFE: Permission denied
ERROR mount error: mounting error: fusermount exited with code 256
#+END_EXAMPLE
******* solution
#+BEGIN_SRC shell :results drawer
fusermount -u  ~/MEDIA/BAK/KOPIA/SAFE
kop mount all ~/MEDIA/BAK/KOPIA/SAFE
#+END_SRC
***** TODO alias setup for jobs in module
***** TODO dynamize ~hostName~, ~username~ and ~mountPoints~
**** HOME/INTERNAL
#+BEGIN_SRC shell :results drawer
mkdir -p .KOPIA/INTERNAL
kopia repository create filesystem --path /home/frank/.KOPIA/INTERNAL
#+END_SRC
**** HOME/EXTERNAL
***** create subvolume
#+BEGIN_SRC shell :results drawer
btrfs subvol create KOPIA
#+END_SRC
***** create subvolume
#+BEGIN_SRC shell :results drawer
mkdir -p /srv/BAK/KOPIA/HOME/EXTERNAL
kopia repository create filesystem --path /srv/BAK/KOPIA/HOME/EXTERNAL
#+END_SRC
*** timer
**** check time
#+BEGIN_SRC shell :results drawer
systemd-analyze calendar --iteration 5 '*:00/30'
#+END_SRC
*** service
=/home/frank/.config/systemd/user/kopia-test-every-2min.service=
** UNSORTED
*** systemd-unit
https://www.freedesktop.org/software/systemd/man/systemd.unit.html#%5BUnit%5D%20Section%20Options
'' ### KEEP: closes nix string



# Local Variables:
# mode: org
# End:
