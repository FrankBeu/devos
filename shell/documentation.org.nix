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
~bud~ does not run scripts in =${config.bud.localFlakeClone}/shell/bud/= \\
~bud~ runs scripts from the nixstore based on =${config.bud.localFlakeClone}/shell/bud/= \\
changes (like tests.bash-updates) have to be propagated into the store with e.g. ~bs~ \\
always use ~$${FLAKEROOT}~ in scripts to make them globally useable
*** help
do not create a "help"-section in scripts \\
use the built-in ~bud COMMAND help~ \\
which displays the ~synopsis~, the ~help~ and the ~description~
*** script
#+BEGIN_SRC shell :results none
bat /run/current-system/sw/bin/bud
#+END_SRC
lists ~ENVS~ which are available in each script
'' ### KEEP: closes nix string
