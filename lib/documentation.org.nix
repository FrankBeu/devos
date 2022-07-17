# -*- mode:org; -*-
{ config }:
''
---
title: lib
linktitle: lib
description: documentation for lib
categories:
keywords: [ lib, DEVOS, structure ]
menu:
  sidebar:
    parent: "structural"
    name: "lib"
    identifier: "lib"
    weight: 90
draft: false
toc: true
---
* lib
** access
*** example
#+BEGIN_SRC nix
lib.our.debugging.printContainer <SET>
#+END_SRC
** tests
*** location
lib-tests are located in =../checks/lib/default.nix=
** INFO
*** =../nixos/default.nix=
#+BEGIN_SRC nix
{ lib.our = self.lib; }
#+END_SRC
* FOOTER                                                           :noexport:
'' ### KEEP: closes nix string
# Local Variables:
# mode: org
# End:
