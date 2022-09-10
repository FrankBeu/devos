# -*- mode:org; -*-
{ docVars
}:
let
inherit (docVars)
  actionpath
  keybindings
;
in
with keybindings;
''
---
title: actionButton
linktitle: actionButton
description: documentation for actionButton
categories:
keywords: [ actionButton, i3, workflow, volatiles ]
menu:
  sidebar:
    parent: "home-manager"
    name: "actionButton"
    identifier: "actionButton"
draft: false
toc: true
---
* actionButton
define actions/scripts which can be fired with i3 \\
used to automate a arbitrary volatile workflow \\
volatile support-scripts for the current task
** scripts are not managed by nix
only TEMPLATES \\
and EXAMPLES
** BAK
- create =~/${actionpath}/FUNDUS/{{FEATURE}}/=
- copy all scripts to =~/${actionpath}/FUNDUS/{{FEATURE}}/=
*** kopiaBAKed
** keybindings
*** i3-Trigger: =${mod}+${modeTrigger}=
| KEY | SCRIPT                        |
|-----+-------------------------------|
| y   | ~/${actionpath}/y.zsh         |
| u   | ~/${actionpath}/u.zsh         |
| i   | ~/${actionpath}/i.zsh         |
| o   | ~/${actionpath}/o.zsh         |
| p   | ~/${actionpath}/p.zsh         |
|     |                               |
| h   | ~/${actionpath}/h.zsh         |
| j   | ~/${actionpath}/j.zsh         |
| k   | ~/${actionpath}/k.zsh         |
| l   | ~/${actionpath}/l.zsh         |
| ;   | ~/${actionpath}/semicolon.zsh |
|     |                               |
| n   | ~/${actionpath}/n.zsh         |
| m   | ~/${actionpath}/m.zsh         |
| ,   | ~/${actionpath}/comma.zsh     |
| .   | ~/${actionpath}/period.zsh    |
| /   | ~/${actionpath}/slash.zsh     |
**** scripts can be edited with the same keybinding and an additional =SHIFT=
'' ### KEEP: closes nix string
