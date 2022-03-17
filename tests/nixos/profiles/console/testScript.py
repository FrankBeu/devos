machine.wait_for_unit("multi-user.target")

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if consoleFont is set"):

    prepareConsoleForSCROT()

    machine.send_chars("showconsolefont\n")

    checkGoldenSCROT("consoleFont.png", "consoleFontActual")
