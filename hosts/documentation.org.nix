# -*- mode:org; -*-
{ config, ...}:
''
---
title: hosts
linktitle: hosts
description: documentation for hosts
categories:
keywords: [ hosts, home-manager, system, DEVOS, structure ]
menu:
  sidebar:
    parent: "structural"
    name: "hosts"
    identifier: "hosts"
    weight: 80
draft: false
toc: true
---
* hosts
** naming
*** prefixes
If a hostConfiguration without prefix exists, a prefixed configuration wraps the correspondent one. \\
Otherwise it is a standalone configuration.
**** *iso*
- only used to generate an ISO
**** *vm*
- make a host-configuration useable as a vm
  - used to make a host-configuration testable
        e.g.: network, nixOptions, qemuGuest
** iso
*** build
#+BEGIN_SRC shell :results none
bud build isoBase bootstrapIso
#+END_SRC
*** connect
reachable on the local link via ssh root@fe80::47%eno1 \\
where 'eno1' is replaced by your own machine's network interface that has the local link to the target machine
** TODO add new host
**** as replacement
additionally use backups as dataProvider
'' ### KEEP: closes nix string
