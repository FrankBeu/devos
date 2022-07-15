# { config, nixosConfig }:
# let
#   inherit (config.home)                 username;
#   inherit (nixosConfig.networking) hostName;
#   inherit (nixosConfig.bud)            localFlakeClone;
# in
''
---
title: pipewire
linktitle: pipewire
description: documentation for pipewire
categories:
keywords: [ pipewire, sound ]
menu:
  sidebar:
    parent: "system"
    name: "pipewire"
    identifier: "pipewire"
draft: false
toc: true
---
* pipewire
** INFO
[[https://nixos.wiki/wiki/PipeWire][PipeWire - NixOS Wiki]] \\
[[https://wiki.archlinux.org/title/PipeWire][PipeWire - ArchWiki]] \\
[[https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/home][Home · Wiki · PipeWire / pipewire · GitLab]] \\
[[https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Config-PipeWire][Config PipeWire · Wiki · PipeWire / pipewire · GitLab]]

[[https://venam.nixers.net/blog/unix/2021/06/23/pipewire-under-the-hood.html][PipeWire Under The Hood]] \\
[[https://venam.nixers.net/blog/unix/2021/02/07/audio-stack.html][Making Sense of The Audio Stack On Unix]]
*** locations
=/etc/alsa/conf.d/= \\
=/etc/pipewire=
*** commands
**** view commands
  ~pw- TAB~
**** pw-dot
create pw.dot
#+BEGIN_SRC shell :results drawer
pw-dot
dot pw.dot -Tpng -o pw.png
firefox pw.png
#+END_SRC
**** pw-dump
#+BEGIN_SRC shell :results drawer
  pw-dump -C always PJSON
#+END_SRC
* TODO TODOS
** tools
[[https://fedoramagazine.org/helvum-and-easyeffects-two-great-applications-for-pipewire-users/][Helvum and EasyEffects: Two great applications for PipeWire users - Fedora Magazine]]
*** easyeffects
https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=easyEffects
*** helvum
[[https://gitlab.freedesktop.org/pipewire/helvum][PipeWire / Helvum · GitLab]] \\
[[https://www.youtube.com/watch?v=DreAIxZ4Cuo][Helvum - Pipewire Patchbay unter Ubuntu 20.04 [GER Tutorial] - YouTube]]
*** jamesdsp
https://search.nixos.org/packages?channel=unstable&query=jamesdsp
*** noiseTorch
https://search.nixos.org/packages?channel=unstable&query=noisetorch
*** pavucontrol
https://search.nixos.org/packages?channel=unstable&query=pavucontrol
*** soundux
[[https://soundux.rocks/][Soundux]] \\
[[https://github.com/Soundux/Soundux][Soundux/Soundux: 🔊 A cross-platform soundboard]]
* FOOTER                                                           :noexport:
'' ### KEEP: closes nix string
# Local Variables:
# mode: org
# End:
