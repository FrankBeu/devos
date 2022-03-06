### TODO cleanUp
### TODO interact
### TODO check config (jkl;)
machine.wait_for_unit("multi-user.target")

# with subtest("Check if $EDITOR is set to vim"):
#     machine.succeed('test $(basename "$EDITOR") = vim')

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if vim is available"):
    output = machine.succeed('vim -h')
    machine.log(output)



# with subtest("Check if vim is available"):
#     output = machine.execute("vim")[1]
#     machine.log(output)

# machine.sleep(5)

# with subtest("Check if vim is working"):
#     machine.copy_from_host(
#     "${./test.txt}",
#     "/home/nixos/test.txt",
#     )
#     # machine.succeed("vim /home/nixos/test.txt")
#     machine.execute("vim /home/nixos/test.txt")
#     machine.send_chars(":q")

    # machine.send_key("ctrl-spc")
    # machine.send_key("colon")
    # machine.send_key("q")
    # machine.send_key("q")

# machine.succeed("cat /home/nixos/test.txt")
# machine.screenshot("vim")
# machine.execute("pkill vim")

# machine.sleep(5)
#machine.screenshot("vim")
