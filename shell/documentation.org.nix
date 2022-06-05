# -*- mode:org; -*-
{ config }:
''
---
title: shell
linktitle: shell
description: documentation for shell
categories:
keywords: [ shell, DEVOS, structure ]
menu:
  sidebar:
    parent: "structural"
    name: "shell"
    identifier: "shell"
    weight: 130
draft: false
toc: true
---
* shell
** bud
*** ATTENTION
~bud~ does not run scripts in =${config.bud.localFlakeClone}/shell/bud/=
~bud~ runs scripts from the nixstore based on =${config.bud.localFlakeClone}/shell/bud/=
changes (like tests.bash-updates) have to be propagated into the store with e.g. ~bs~
'' ### KEEP: closes nix string
