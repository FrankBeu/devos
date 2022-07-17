# -*- mode:org; -*-
{ config }:
''
---
title: pkgs
linktitle: pkgs
description: documentation for pkgs
categories:
keywords: [ pkgs, DEVOS, nvfetcher, structure ]
menu:
  sidebar:
    parent: "structural"
    name: "pkgs"
    identifier: "pkgs"
    weight: 120
draft: false
toc: true
---
* pkgs
is implemented as overlay
** sources
Are managed by ~nvfetcher~. \\
In a package they can be used just like:
callPackage will take care of the rest
#+BEGIN_SRC nix
  { # ...
    , sources
      };
  ### XOR
  inherit (sources.SOURCENAME) pname version src;
  inherit (sources.SOURCENAME) pname version src cargoLock;
#+END_SRC
*** nvfetcher
just specify the needed sources in =sources.toml= \\
If  ~cargo_lock = "Cargo.lock"~ is set, it will be automatically created. \\
a cargo-lock-dir has to be removed manually if the sources are deleted.
**** update all sources
#+BEGIN_SRC shell :results none
nvfetcher
#+END_SRC
**** update sources from regex
#+BEGIN_SRC shell :results none
nvfetcher  -f      <REGEX>
nvfetcher --filter <REGEX>
#+END_SRC
**** add =Cargo.lock= to git (optional)
allways add file to git \\
even after updates (filename will change) \\
otherwise nix will throw the following error:
#+BEGIN_EXAMPLE
error: getting status of '/nix/store/SHA-source/pkgs/_sources/NAME-SHA: No such file or directory
#+END_EXAMPLE
** packages
*** purpose
packages not available via a channel
** flake
A package provided by a flake can be used by referencing it like:
#+BEGIN_SRC nix
  inherit (inputs.rnix-lsp.packages."$${prev.system}") rnix-lsp;
#+END_SRC
** creation
*** patching
**** create patch(es) between commits
***** XOR
#+BEGIN_SRC shell :results none
git format-patch -1 HEAD
#+END_SRC
#+BEGIN_SRC shell :results none
git format-patch HEAD~1
#+END_SRC
**** patchPhase
#+BEGIN_SRC nix
patches = [
  FILENAME.patch
  ### ...
];
#+END_SRC
*** patches can also be applied as overlay
if derivation exists
cf.: \\
doc: http://doc.local/structural/overlays/ \\
org: [[file:~/DEVOS/overlays/documentation.org.nix::*patches][patches]]
** specific
*** i3statusBar
**** TODO extract/reactivate (externalModule?|subModule)
*** riv
*** powerline-go
'' ### KEEP: closes nix string
