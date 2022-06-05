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
'' ### KEEP: closes nix string
