# -*- mode:org; -*-
{ config }:
''
---
title: checks
linktitle: checks
description: documentation for checks
categories:
keywords: [ checks, DEVOS, structure ]
menu:
  sidebar:
    parent: "structural"
    name: "checks"
    identifier: "checks"
    weight: 50
draft: false
toc: true
---
* checks
** lib
lib-tests can be run with
#+BEGIN_SRC shell :results drawer
  nix build .#checks.libTests
#+END_SRC
* FOOTER                                                           :noexport:
'' ### KEEP: closes nix string
