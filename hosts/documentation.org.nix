# -*- mode:org; -*-
{ config }:
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
    weight: 70
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
** TODO add new host
**** as replacement
additionally use backups as dataProvider
'' ### KEEP: closes nix string
