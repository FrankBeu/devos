### TODO cleanUp
### TODO interact
### TODO check config
machine.wait_for_unit("multi-user.target")

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if RANGER is available"):
    output = machine.succeed('ranger -h')
    machine.log(output)
    # machine.succeed('whereis ranger')

# machine.sleep(5)


# machine.wait_for_unit("default.target")
# if not "Linux" in machine.succeed("uname"):
#     raise Exception("Wrong OS")


# machine.succeed("ranger")
# machine.execute("man ranger")
# machine.get_screen_text
# man = machine.succeed("man ranger")
# print(f"\n{man}\n")
# machine.sleep(5)
# machine.wait_until_succeeds("man ranger")
# machine.execute("man ubectl")
# output = machine.execute("ranger")[1]
# machine.log(output)

# machine.execute("pkill ranger")
# machine.shell_interact
# machine.screenshot("rangerm")
