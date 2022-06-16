{ username }:
''
machine.wait_for_unit("multi-user.target")

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if variables are available for system"):
    output = machine.succeed('diff /tmp/variablesTest{Actual,Target}')
    machine.log(output)
    ### diff will terminate with 1 if a difference is found

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if variables are available for homemanager"):
    output = machine.succeed('diff /home/${username}/tmp/variablesTestActual /tmp/variablesTestTarget')
    machine.log(output)
    ### diff will terminate with 1 if a difference is found
''

# Local Variables:
# mode: python
# End:
