# -*- mode:org; -*-
{ config }:
''
---
title: users
linktitle: users
description: documentation for users
categories:
keywords: [ users, home-manager, system, DEVOS, structure ]
menu:
  sidebar:
    parent: "structural"
    name: "users"
    identifier: "users"
    weight: 150
draft: false
toc: true
---
* users
** definition
*** files
- =${config.bud.localFlakeClone}/users/<USERNAME>/=
    nixos-user-definition; home-manager-secrets-registration;
- =${config.bud.localFlakeClone}/secrets/users/<USERNAME>/<HOSTNAME>/secrets.yaml=
    encrypted-secrets;
- =${config.bud.localFlakeClone}/hosts/<HOSTNAME>/home/<USERNAME>/=
    home-manager-definition;
- =${config.bud.localFlakeClone}/hosts/<HOSTNAME>/variables/<USERNAME>/=
    variables;
** add new user
**** =users=
- create user
  #+BEGIN_SRC shell :results none
  cp -r TEMPLATE <USERNAME>
  #+END_SRC
**** =home=
- add to =home/default.nix=: ~users~
  #+BEGIN_SRC nix
  <USERNAME> = { suites, ... }: {};
  #+END_SRC
**** =hosts/<HOSTNAME>=
- add dir =<USERNAME>= to =hosts/<HOSTNAME>/home/=
- add to =hosts/<HOSTNAME>/variables/default.nix=
  #+BEGIN_SRC nix
  <USERNAME> = import ../home/<USERNAME>/variables;
  #+END_SRC
- add to =hosts/<HOSTNAME>/home.nix=: ~home-manager.users~
  #+BEGIN_SRC nix
  "<USERNAME>" = import ./home/<USERNAME>;
  #+END_SRC
- add to =hosts/<HOSTNAME>/system.nix=: ~imports~
#+BEGIN_SRC nix
profiles.users.<USERNAME>
#+END_SRC

*** TODO create ~bud new (user|host)~
** groups
groups can be set precautionary - they will only be applied, if the actual group exists \\
applying userGroups can be tested by logging into a virtualConsole
'' ### KEEP: closes nix string
