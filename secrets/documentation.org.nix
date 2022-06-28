# -*- mode:org; -*-
{ config }:
''
---
title: secrets
linktitle: secrets
description: documentation for secrets
categories:
keywords: [ secrets, credentials, sops, gpg ]
menu:
  sidebar:
    parent: "structural"
    name: "secrets"
    identifier: "secrets"
    weight: 120
draft: false
toc: true
---
* secrets
secrets are encrypted using *sops-nix* \\
https://github.com/Mic92/sops-nix
** ATTENTION
*** test-host
- ssh-secret-key is publicly available
- test-age-key  is publicly available
**** test-{host,user}-secrets can be edited using
#+BEGIN_SRC shell :results none
  EDITOR=vim SOPS_AGE_KEY_FILE="${config.bud.localFlakeClone}/secrets/keys/publiclyAvailable/users/test/key.sec"  \sops "${config.bud.localFlakeClone}/secrets/users/test/test/secrets.yaml"
  EDITOR=vim SOPS_AGE_KEY_FILE="${config.bud.localFlakeClone}/secrets/keys/publiclyAvailable/users/test/key.sec" \\sops "${config.bud.localFlakeClone}/secrets/hosts/test/secrets.yaml"
#+END_SRC
*** keys
**** ${config.bud.localFlakeClone}/secrets/keys/publiclyAvailable
all keys are version controlled
**** ${config.bud.localFlakeClone}/secrets/keys/secret
all files are gitignored \\
(except the .gitignore)
***** vm w/ secrets
Each vm which uses secrets needs to have an ssh-key availble here \\
cf.: ="${config.bud.localFlakeClone}/hosts/test/system.nix:42:2"= \\
In order to be picked up by the flake, a checked in dummy key has to be overlayed with a real key.
****** copy the publiclyAvailable host key to the new vmHost's secret-folder
#+BEGIN_SRC shell :results none
    HOST=<HOSTNAME>
    cp \
    ${config.bud.localFlakeClone}/secrets/keys/publiclyAvailable/hosts/test/ \
    ${config.bud.localFlakeClone}/secrets/keys/secret/hosts/''${HOST}
#+END_SRC
****** check it in
****** generate a passwordless key
#+BEGIN_SRC shell :results none
HOST=<HOSTNAME>
DIR=${config.bud.localFlakeClone}/secrets/keys/secret/hosts/''${HOST}
mkdir -p ''${DIR} &&
ssh-keygen     \
    -t ed25519 \
    -a 100     \
    -P ""      \
    -C ''${HOST} \
    -f ''${DIR}/ssh_host_ed25519_key
#+END_SRC
****** tell git not to care about changes
#+BEGIN_SRC shell :results none
HOST=<HOSTNAME>
git update-index --skip-worktree ~/DEVOS/secrets/keys/secret/hosts/''${HOST}/ssh_host_ed25519_key
git update-index --skip-worktree ~/DEVOS/secrets/keys/secret/hosts/''${HOST}/ssh_host_ed25519_key.pub
#+END_SRC
****** add age-handle to =${config.bud.localFlakeClone}/.sops.yaml=
1. key to clipboard
    #+BEGIN_SRC shell :results none
    HOST=<HOSTNAME>
    PATH_TO_PUB_KEY=${config.bud.localFlakeClone}/secrets/keys/secret/''${HOST}/ssh_host_ed25519_key.pub
    cat ''${PATH_TO_PUB_KEY} | ssh-to-age | xsel -ib
    #+END_SRC
2. add to =.sops.yaml= manually
****** reencrypt affected secrets
* secret
** keyCreation
*** user
cf. age
*** host
#+BEGIN_SRC shell :results none
  cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age'
#+END_SRC
    add the publicKey to ="${config.bud.localFlakeClone}/.sops.yaml"=
** add a secret
*** create/edit the secrets-file
#+BEGIN_SRC shell :results none
  sops "${config.bud.localFlakeClone}/secrets/PATH-TO-SECRET-DIR/secrets.yaml"
#+END_SRC
=PATH-TO-SECRET-DIR= must exist
** use secret as user
#+BEGIN_SRC nix
  sops.secrets.NAME = {
    owner = config.users.users.USER.name;
    group = config.users.users.USER.group; ### -r-------- 1 USERNAME USERGROUP
  };

  EXAMPLE = config.sops.secrets.NAME.path;
#+END_SRC
** user-passwords
location: =${config.bud.localFlakeClone}/secrets/users/<USER>/<HOST>/secrets.yaml=
- can only be used hashed
- when editing with emacs, a hash can be inserted by the following instruction
  - yank the following line:
  #+BEGIN_SRC shell :results none
     mkpasswd -m sha-512
  #+END_SRC
  - move the cursor to location the password should be insterted
  - press =C-U SPC ! C-Y=
  - append  a space and the PASSWORD
  - press =RET=
** keyChanges
*** create key
*** remove old key
*** edit =.sops.yaml=
*** reEncrypt
#+begin_src shell :results none
sops updatekeys "${config.bud.localFlakeClone}/secrets/PATH-TO-SECRET-DIR/secrets.yaml"
#+end_src
#+begin_src shell :results none
  cd "${config.bud.localFlakeClone}/secrets"
  fd secrets.yaml -x sops updatekeys -y
#+end_src
** secrets
*** nixos
have to be registered in place
**** TODO implement same mechanism as for user
*** home
each secret has to be
- encrypted in
  ="${config.bud.localFlakeClone}/secrets/users/<USERNAME>/<HOST>/secrets.yaml"=
- registered in
  ="${config.bud.localFlakeClone}/users/<USERNAME>/secrets/default.nix"=
** TODO TODOS
*** TODO link to sops
** DEPRECATED GPG                                                  :noexport:
:LOGBOOK:
- State "DEPRECATED" from "TEST"       [2022-05-21 Sat 09:55] \\
  use *age* instead
:END:
*** mandatory GPG-keys are needed
- a personal GPG-key (for editing)
- a GPG-key *per* machine
**** machineKey
***** can be created from a RSA-ssh-key
#+begin_src shell
  sudo ssh-to-pgp -i /etc/ssh/ssh_host_rsa_key -o "${config.bud.localFlakeClone}/secrets/publicKeys/hosts/${config.networking.hostName}.asc"
#+end_src
***** the fingerprint has to be inserted into ="${config.bud.localFlakeClone}/.sops.yaml"=
#+begin_src shell :results none
gpg --show-keys "${config.bud.localFlakeClone}/secrets/publicKeys/hosts/${config.networking.hostName}.asc"
#+end_src
***** import into gpg-keyring
#+begin_src shell :results none
  gpg --import "${config.bud.localFlakeClone}/secrets/publicKeys/hosts/${config.networking.hostName}.asc"
#+end_src
** UNSORTED
**** generate a ssh-userKey
#+BEGIN_SRC shell :results none
USER=<USERNAME>
HOST=<HOSTNAME>
DIR=${config.bud.localFlakeClone}/secrets/users/''${USER}/''${HOST}
mkdir -p ''${DIR} &&
ssh-keygen                 \
    -t ed25519             \
    -a 100                 \
    -C ''${USER}@''${HOST} \
    -f ''${DIR}/ssh_host_ed25519_key
#+END_SRC
'' ### KEEP: closes nix string
