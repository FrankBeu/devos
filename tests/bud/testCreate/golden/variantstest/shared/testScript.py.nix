{ username, variant }:
''
machine.wait_for_unit("multi-user.target")

variant = "${variant}"

with subtest(f"▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ tests.nixos.profiles.variantstest.{variant}"):

''

# Local Variables:
# mode: python
# End:
