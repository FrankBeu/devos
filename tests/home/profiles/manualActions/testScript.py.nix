{ username }:
''
machine.wait_for_unit("multi-user.target")

username           = "${username}"

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.manualActions"):
    manual_actions = machine.succeed(f'cat /home/{username}/.manualActions/manualActions.org')
    assert_contains(manual_actions,
f"""* manualActions
In order to keep track of all necessary manual actions two files are needed.
- An automatically created (linked) file which keeps track of all TODOS, according to the installed profiles.
- A copy which keeps track of the states of all the TODOS.
** preparation
*** TODO make a writable copy of the automatically generated file
#+BEGIN_SRC shell :results none
cp -L /home/{username}/.manualActions/manualActions.org /home/{username}/.manualActions/manualActionsState.org
chmod 644 /home/{username}/.manualActions/manualActionsState.org
#+END_SRC
** TASKS
*** TODO-entry completed
set its state to DONE in [[/home/{username}/.manualActions/manualActionsState.org]]
do not change =/home/{username}/.manualActions/manualActions.org=
*** new TODO appears in =/home/{username}/.manualActions/manualActions.org=
**** copy it to =/home/{username}/.manualActions/manualActionsState.org=
#+BEGIN_EXAMPLE shell
emacsclient -nc -a "" --eval '(ediff-files "/home/{username}/.manualActions/manualActions.org" "/home/{username}/.manualActions/manualActionsState.org")'
#+END_EXAMPLE
*** check
#+BEGIN_EXAMPLE shell
deltas $(realpath /home/{username}/.manualActions/manualActions.org) /home/{username}/.manualActions/manualActionsState.org
#+END_EXAMPLE
**** ignore '\ No newline at end of file'
feature: append new tasks seamlessly.""")
''



# Local Variables:
# mode: python
# End:
