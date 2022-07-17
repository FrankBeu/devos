# -*- mode:org; -*-
{ config }:
''
---
title: doc
linktitle: doc
description: documentation for the DEVOS-configuration
categories:
keywords: [ nixos, documentation, DEVOS, structure ]
menu:
  sidebar:
    parent: "structural"
    weight: 60
draft: false
toc: true
---
* doc
*hugo* is used as documentation-tool
** USAGE
- if the documentation-suite is enabled, the documentation is served automatically
- documentation of all *available* features (profiles, suites) is accessible on each host at http://doc.local.
- just press =SUPER-F1=
** contentCreation
*** categories
**** home
- only for homepage -> index.org
- appears under global
**** global
- add files directly to =nixos/profiles/services/documentation/content/CATEGORY/FILE=
- register them in =nixos/profiles/services/documentation/default.nix=
**** home-manager
- files are created under =/home/USER/.docLocal/content/homemanager/= and symlinked to =/etc/docLocal/content/homemanager=
- file-creation =default.nix=
#+BEGIN_SRC nix
  home.file.".docLocal/content/homemanager/git.org".source = ./git.org;
#+END_SRC
- appending in-place with
#+BEGIN_SRC nix
  home.file.".docLocal/content/homemanager/git.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter '''
    ''${(builtins.readFile ./doc.org)}
  ''');
#+END_SRC

- base-files for documentation-attachments are created in =home/profiles/docDotLocal/default.nix=
**** structural
- documentation for each section of DEVOS
- files are in each subfolder of =${config.bud.localFlakeClone}=
- files are registered in =${config.bud.localFlakeClone}/nixos/profiles/services/documentation/default.nix=
**** system
- file-creation in =default.nix=
#+BEGIN_SRC nix
  environment.etc."/docLocal/content/system/<SECTION>.org".source = ./<SECTION>.org;
#+END_SRC
- if not available -> global
- appending in-place with
#+BEGIN_SRC nix
  environment.etc."/docLocal/content/system/<SECTION>.org".text = pkgs.lib.mkDefault( pkgs.lib.mkAfter '''<CONTENT>''';
#+END_SRC
- base-files for documentation-attachments are created in =nixos/profiles/services/documentation/default.nix=
*** orgmode
is used as markup-lang
**** examples
https://niklasfasching.github.io/go-org/
**** linebreak
#+BEGIN_SRC org
  at end of line: \\
#+END_SRC
**** emphasis
#+BEGIN_SRC html
  <strong>CONTENT</strong>
#+END_SRC
#+BEGIN_SRC org
  *CONTENT*
#+END_SRC
**** srcCode
***** do not use
#+BEGIN_SRC org
#+begin_example
#+END_SRC
-> will not be highlighted
***** always use
#+begin_src org
#+begin_src
#+end_src
** other documentation
*** man pages
**** configuration.nix(5) man page
#+BEGIN_SRC shell :results drawer
man configuration.nix
**** home-manager
#+BEGIN_SRC shell :results drawer
man home-configuration.nix
#+END_SRC
*** NixOS manual in browser
#+BEGIN_SRC shell :results drawer
nixos-help
#+END_SRC
* development
** hugo
*** resources have to be writeable if ~hugo serve~ is used
*** TODO TODOS
**** DONE domain =*.local.=
**** DONE hugo server
**** DONE systemd service
**** DONE deployment on switch
**** DONE reverseProxy doc.local -> localhost:41503
**** DONE manual actions
**** TODO configurable theme
**** TODO improve theme
***** headings
****** make them more distingushable
****** style them down to max org-level
****** use indentation
***** footer
**** TODO improve org-style
- writeable in org
- readable in org and hugo
- when to use headings
- when to use listings
*** categories
**** DONE mirror devos-structure
**** difference
***** feature documentation
***** development documentation
*** structure
**** =./content=
***** empty folders are kept for category-reference
***** names are used as part of the url (cf. homemanager instead of home-manager)
***** resides directly in each [profils,module,...]-directory
***** or in =nixos/profiles/services/documentation/content/=
***** hugo-files resides in =doc/docLocal/=
****** TODO colors are defined in  =nixos/profiles/services/documentation/colors/colors.scss.nix=
** orgmodeInNix
*** Escape
**** dollarSign
a *$* can be escaped with *''\'''\'$*
***** text
result: ~''${USER}~ \\
writen as: ~''\'''\'''${USER}~
***** src
result:
#+BEGIN_SRC python :results none
''${USER}
#+END_SRC
writen as:
#+BEGIN_SRC python :results none
''\'''\'''${USER}
#+END_SRC
'' ### KEEP: closes nix string
