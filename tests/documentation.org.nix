# -*- mode:org; -*-
{ config }:
''
---
title: testing
linktitle: testing
description: documentation for testing
categories:
keywords: [ testing, DEVOS, structure ]
menu:
  sidebar:
    parent: "structural"
    name: "testing"
    identifier: "testing"
    weight: 140
draft: false
toc: true
---
* TODO testing
** creation
*** manually
- create a directory with a =default.nix=
- the name of the directory will be used automatically as the testname (nec. for ~collectTests~)
- the uppercaseTestname is used in the derivationName =/nix/store/<hash>-nixos-test-driver-TESTNAME.drv=
- just copy a working test and adjust it
- tests are automatically registered via ~collectTests~
- tests have to be staged in order to be available to the flake !!!
- register test in =shell/bud/tests.bash=
*** automatically
- ~bud testCreate TYPE LOCATION~
- stage
- register test in =shell/bud/tests.bash=
*** goldenFiles
- create a goldenTest
  - ~bud testCreate g LOCATION~
- run ~check_golden_scrot(*debug=True*)~
- cp result/GOLDEN.png to LOCATION/golden/<NAME>Target.png
- run ~check_golden_scrot(*debug=False*)~
** run
*** single test
#+BEGIN_EXAMPLE shell
nix build .#tests.nixos.profiles.timezone.amsterdam
#+END_EXAMPLE
*** all tests
#+BEGIN_EXAMPLE shell
bud tests
#+END_EXAMPLE
*** check for available test
1. enter the ~nix repl~
2. load flake ~:lf ./.~
3. check for possible completions (tab) for the ~tests.~ attribute
*** interactively
https://nixos.org/manual/nixos/stable/index.html#sec-running-nixos-tests-interactively
**** starting
***** w/o bud
#+BEGIN_EXAMPLE shell
nix build .#tests.nixos.profiles.timezone.amsterdam.driverInteractive
#+END_EXAMPLE
#+BEGIN_EXAMPLE shell
./result/bin/nixos-test-driver --interactive
#+END_EXAMPLE
***** w/ bud
#+BEGIN_EXAMPLE shell
bud testPrebuild tests.nixos.profiles.timezone.amsterdam
#+END_EXAMPLE
#+BEGIN_EXAMPLE shell
bud testInteractive
#+END_EXAMPLE
**** acting
#+BEGIN_EXAMPLE python
start_all()
#+END_EXAMPLE
#+BEGIN_EXAMPLE python
machine.…
#+END_EXAMPLE
**** run testScript
#+BEGIN_EXAMPLE python
test_script()
#+END_EXAMPLE
** INFO
*** naming
in order to be collectable and callable with the shortest name possible, *the testname must be created automatically* (based on dirname).
**** variants
are named ~{varA,varB,...}~
cf. ~tests.home.profiles.i18n.fcitx~
*** snippets
- are available in emacs ~python-mode~ and ~nix-mode~
- start with ~devosTest~  / ~devte~ (name / key )
*** testing
**** do not use ~whereis COMMAND~
will always exit with 0
*** ~send_key~
=nixos/lib/test-driver/test-driver.py=
**** constructed from QEMU-doc
https://en.wikibooks.org/wiki/QEMU/Monitor#sendkey_keys
#+BEGIN_EXAMPLE python
machine.send_key("0")
machine.send_key("1")
machine.send_key("2")
machine.send_key("3")
machine.send_key("4")
machine.send_key("5")
machine.send_key("6")
machine.send_key("7")
machine.send_key("8")
machine.send_key("9")

machine.send_key("a")
machine.send_key("b")
machine.send_key("c")
machine.send_key("d")
machine.send_key("e")
machine.send_key("f")
machine.send_key("g")
machine.send_key("h")
machine.send_key("i")
machine.send_key("j")
machine.send_key("k")
machine.send_key("l")
machine.send_key("m")
machine.send_key("n")
machine.send_key("o")
machine.send_key("p")
machine.send_key("q")
machine.send_key("r")
machine.send_key("s")
machine.send_key("t")
machine.send_key("u")
machine.send_key("v")
machine.send_key("w")
machine.send_key("x")
machine.send_key("y")
machine.send_key("z")

machine.send_key("<")
machine.send_key("asterisk")
machine.send_key("comma")
machine.send_key("dot")
machine.send_key("equal")
machine.send_key("minus")
machine.send_key("slash")

machine.send_key("alt")
machine.send_key("alt_r")
machine.send_key("altgr")
machine.send_key("altgr_r")
machine.send_key("ctrl")
machine.send_key("ctrl_r")
machine.send_key("shift")
machine.send_key("shift_r")
machine.send_key("meta")    ### trial&err  assumption
machine.send_key("meta_r")  ### trial&err  use for i3

machine.send_key("backspace")
machine.send_key("caps_lock")
machine.send_key("esc")
machine.send_key("menu")
machine.send_key("ret")
machine.send_key("spc")
machine.send_key("tab")

machine.send_key("f1")
machine.send_key("f2")
machine.send_key("f3")
machine.send_key("f4")
machine.send_key("f5")
machine.send_key("f6")
machine.send_key("f7")
machine.send_key("f8")
machine.send_key("f9")
machine.send_key("f10")
machine.send_key("f11")
machine.send_key("f12")

machine.send_key("left")
machine.send_key("up")
machine.send_key("down")
machine.send_key("right")

machine.send_key("delete")
machine.send_key("end")
machine.send_key("home")
machine.send_key("insert")
machine.send_key("num_lock")
machine.send_key("pgdn")
machine.send_key("pgup")
machine.send_key("print")
machine.send_key("scroll_lock")
machine.send_key("sysrq")

machine.send_key("kp_0")
machine.send_key("kp_1")
machine.send_key("kp_2")
machine.send_key("kp_3")
machine.send_key("kp_4")
machine.send_key("kp_5")
machine.send_key("kp_6")
machine.send_key("kp_7")
machine.send_key("kp_8")
machine.send_key("kp_9")
machine.send_key("kp_add")
machine.send_key("kp_decimal")
machine.send_key("kp_divide")
machine.send_key("kp_enter")
machine.send_key("kp_multiply")
machine.send_key("kp_subtract")
#+END_EXAMPLE
**** collected from nixos-tests (purged, only additions)
#+BEGIN_EXAMPLE python
machine.send_key("\n")
machine.send_key("alt-3")
machine.send_key("alt-ctrl-x")
machine.send_key("alt-f")
machine.send_key("alt-f1")
machine.send_key("alt-f2")
machine.send_key("alt-f3")
machine.send_key("alt-f4")
machine.send_key("alt-f5")
machine.send_key("alt-q")
machine.send_key("alt-ret")
machine.send_key("alt-shift")
machine.send_key("alt-shift-e")
machine.send_key("alt-shift-q")
machine.send_key("alt-tab")
machine.send_key("ctrl-alt-delete")
machine.send_key("ctrl-alt-shift-u")
machine.send_key("ctrl-d")
machine.send_key("ctrl-n")
machine.send_key("ctrl-q")
machine.send_key("ctrl-s")
machine.send_key("ctrl-spc")
machine.send_key("ctrl-t")
machine.send_key("ctrl-w")
machine.send_key("ctrl-x")
machine.send_key(f"alt-f{tty_number}")
#+END_EXAMPLE
*** ~copy_from_host~
can only copy files, which are in the nix store
cannot be used directly from python
cf. =tests/nixos/profiles/console/default.nix=
*** screenshots
**** python commands do not produce a result (do not act on cli)
#+BEGIN_EXAMPLE python
machine.succeed("cat /home/nixos/test.txt")
#+END_EXAMPLE
**** use
***** XOR
#+BEGIN_EXAMPLE python
machine.send_chars("cat /home/nixos/test.txt")
machine.send_key(  "ret")
#+END_EXAMPLE
#+BEGIN_EXAMPLE python
machine.send_chars("cat /home/nixos/test.txt\n")
#+END_EXAMPLE
**** console
if a screenshot is taken from a console the cursor has to be invisible.
*** profiles
**** all profiles enabled in host will be available during tests
*** testHelpers
**** are globally defined in =lib/testing/auxiliary.py=
***** usage
cf. =tests/nixos/profiles/timezone/amsterdam/default.nix=
*** general information concerning testing in the nix-ecosystem
**** types
***** system
***** package
***** content
**** docs
- NixOS - NixOS 21.11 manual
  https://nixos.org/manual/nixos/stable/index.html#sec-nixos-tests

- NixOS - Nixpkgs 21.11 manual
  https://nixos.org/manual/nixpkgs/stable/#sec-package-tests

- Building and Testing
  https://nixos.org/manual/nix/stable/expressions/simple-building-testing.html

- NixOS Testing library - NixOS Wiki
  https://nixos.wiki/wiki/NixOS_Testing_library

- nixpkgs/nixos/tests at master · NixOS/nixpkgs
  https://github.com/NixOS/nixpkgs/tree/master/nixos/tests

- devos/default.nix at 235d9befc2495850d4679b73541c894b266e5d8a · d4hines/devos
  https://github.com/d4hines/devos/blob/235d9befc2495850d4679b73541c894b266e5d8a/lib/pkgs-lib/tests/default.nix
**** src
***** nixosTests-commands
=nixpkgs/nixos/lib/test-driver/test_driver/machine.py=
***** noteworthy examples:
=nixpkgs/nixos/tests/atop.nix=
=nixpkgs/nixos/tests/chromium.nix=
=nixpkgs/nixos/tests/fcitx/default.nix=
**** github search
- Search · mkTest extension:nix
    https://github.com/search?q=mkTest+extension%3Anix&type=Code&ref=advsearch&l=&l=

**** tutorials
***** nixosTests
- Running integration tests the nix way #howto
    https://gist.github.com/573/5df7e2e6d72fe31f85a26dd700d08ded

- Haskell for all: How to use NixOS for lightweight integration tests
    https://www.haskellforall.com/2020/11/how-to-use-nixos-for-lightweight.html

- Sander van der Burg's blog: A test framework for the Nix process management framework
    https://sandervanderburg.blogspot.com/2021/04/a-test-framework-for-nix-process.html

- Leveraging NixOS Tests in your Project
    https://nixos.mayflower.consulting/blog/2019/07/11/leveraging-nixos-tests-in-your-project/

- Integration testing using virtual machines (VMs) — nix.dev documentation
    https://nix.dev/tutorials/integration-testing-using-virtual-machines
**** examples
https://github.com/impl/nix-sops/blob/92ce97b8e2ac64fc1fae55fff307aeee83fecdc5/tests/home-manager/make-test.nix
https://github.com/tweag/trustix/blob/e89875c2a40588c7badeb52ec31ea23fa2e0c7b6/packages/trustix/tests/default.nix
https://github.com/NixOS/nixpkgs/blob/master/nixos/tests/nat.nix#L67
https://github.com/tubleronchik/kuka-airapkgs/blob/d3bea431b0a092c67256f0c92e362f641182af8b/pkgs/build-support/rust/build-rust-crate/test/default.nix
***** devos
****** 1
https://github.com/jbl-proglove/devos/blob/4dd727c4015885ba0a300042fccee76599c1dfa9/tests/default.nix
https://github.com/rafifos/devos/tree/bb9dc54af8a83d498ce3ef529a8efc575758952b/tests
****** 2
https://github.com/divnix/digga/blob/main/src/tests.nix
****** 3
https://github.com/d4hines/devos/blob/235d9befc2495850d4679b73541c894b266e5d8a/lib/pkgs-lib/tests/default.nix
*** profiles using nixos and home
are tested in the home section of tests by pulling in tests from nixos
** *TODOS*
*** TODO create this file dynamically from module
*** TODO test lib like digga
currently not working because of flake-util error
reopen after realign with digga
*** TODO write missing test
cf =./tests.bash=
*** snippets
#+BEGIN_EXAMPLE python
machine.wait_until_succeeds("pgrep -u nixos bash")
#+END_EXAMPLE
**** change tty
#+BEGIN_EXAMPLE python
machine.send_key("ctrl-alt-f2")
#+END_EXAMPLE
**** test systemdservice
#+BEGIN_EXAMPLE python
machine.wait_for_unit("documentation.service")
with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if DOCUMENTATION-TEST-FILES are available"):
    _, doc = machine.systemctl("status hugo.service --no-pager")
    machine.log(doc)

    log = machine.succeed("journalctl -b -u hugo.service --no-pager")
    machine.log(print(log))

    etc = machine.succeed("ls -r /etc/docLocal")
    machine.log(print(etc))
    machine.log('=====================================================')
#+END_EXAMPLE
**** ocr
#+BEGIN_EXAMPLE python
gitVersion = machine.get_screen_text()
machine.log(print(gitVersion))
#+END_EXAMPLE
*** prefer ~check_screen_text~ over ~check_golden_scrot~
because of reduced brittleness in host-tests
*** TODO check user nixos and root on hosts *NixOS*
*** TODO move ~machine.wait_for_unit("multi-user.target")~ to =default.nix=, everywhere
'' ### KEEP: closes nix string
