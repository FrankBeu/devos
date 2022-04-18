{ username }:
''
# machine.wait_for_unit("graphical.target")
machine.wait_for_unit("multi-user.target")


with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.home.profiles.editor.emacs"):
    machine.wait_for_file("/home/${username}/.emacs.d")

    machine.succeed('[[ -f /home/${username}/.emacs.d/init.el ]]')
    machine.succeed('[[ -d /home/${username}/.emacs.d/ASSETS ]]')
    machine.succeed('[[ -d /home/${username}/.emacs.d/.local ]]')
    machine.succeed('[[ -d /home/${username}/.emacs.d/BAK ]]')

    ### TODO check behavior

    # machine.succeed('[[ -d /home/${username}/.emacs.d/OUTPUT ]]')
''


# Local Variables:
# mode: python
# End:
