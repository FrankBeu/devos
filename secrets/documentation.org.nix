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
- nixos-age-key  is publicly available
**** test-{host,user}-secrets can be edited using
#+BEGIN_SRC shell :results none
  EDITOR=vim SOPS_AGE_KEY_FILE="${config.bud.localFlakeClone}/secrets/secretKeys/users/nixos/key.sec" \sops "${config.bud.localFlakeClone}/secrets/users/nixos/NixOS/secrets.yaml"
  EDITOR=vim SOPS_AGE_KEY_FILE="${config.bud.localFlakeClone}/secrets/secretKeys/users/nixos/key.sec" \sops "${config.bud.localFlakeClone}/secrets/hosts/NixOS/secrets.yaml"
#+END_SRC
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
- can only be used hashed
- when editing with emacs, a hash can be inserted by the following instruction
  - yank the following line:
  #+BEGIN_SRC shell :results none
     mkpasswd -m sha-512
  #+END_SRC
  - position the cursor at the inserting location
  - press =C-U SPC ! C-Y=
  - append the PASSWORD
  - press =RET=
*** TODO dynamic keybindings
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
'' ### KEEP: closes nix string
