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
    weight: 110
draft: false
toc: true
---
* pkgs
is implemented as overlay
** sources
Are managed by ~nvfetcher~. \\
In a package they can be used like:
#+BEGIN_SRC nix
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
** packages
packages not available via a channel
** flake
A package provided by a flake can be used by referencing it like:
#+BEGIN_SRC nix
  inherit (inputs.rnix-lsp.packages."$${prev.system}") rnix-lsp;
#+END_SRC
'' ### KEEP: closes nix string
