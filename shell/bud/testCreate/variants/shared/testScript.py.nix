{ username, variant }:
''
machine.wait_for_unit("multi-user.target")

variant = "${variant}"

with subtest(f"▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ <TESTNAME>.{variant}"):

''

# Local Variables:
# mode: python
# End:
