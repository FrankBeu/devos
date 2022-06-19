{ group, username }:
''
machine.wait_for_unit("multi-user.target")

group = "${group}"
username = "${username}"

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.manualActions"):
    manual_actions = machine.succeed('cat /etc/manualActions/manualActions.org')
    assert_contains(manual_actions,
f"""* manualActions
In order to keep track of all necessary manual actions two files are needed.
- An automatically created (linked) file which keeps track of all TODOS, according to the installed profiles.
- A copy which keeps track of the states of all the TODOS.
** preparation
*** TODO make a writable copy of the automatically generated file
#+BEGIN_SRC shell :results none
sudo cp -L /etc/manualActions/manualActions.org /etc/manualActions/manualActionsState.org
sudo chmod 644 /etc/manualActions/manualActionsState.org
sudo chown {username}:{group} /etc/manualActions/manualActionsState.org
#+END_SRC
** TASKS
*** TODO-entry completed
set its state to DONE in [[/etc/manualActions/manualActionsState.org]]
do not change =/etc/manualActions/manualActions.org=
*** new TODO appears in =/etc/nixos/manualActions/manualActions.org=
**** copy it to =/etc/manualActions/manualActionsState.org=
#+BEGIN_SRC shell :results none
emacsclient -nc -a "" --eval '(ediff-files "/etc/manualActions/manualActions.org" "/etc/manualActions/manualActionsState.org")'
#+END_SRC
*** check
#+BEGIN_SRC shell :results none
deltas $(realpath /etc/manualActions/manualActions.org) /etc/manualActions/manualActionsState.org
#+END_SRC
**** ignore '\ No newline at end of file'
feature: append new tasks seamlessly.""")
''



# Local Variables:
# mode: python
# End:
