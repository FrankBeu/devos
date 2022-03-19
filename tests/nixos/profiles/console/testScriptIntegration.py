machine.wait_for_unit("graphical.target")

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if consoleFont is set"):

    # machine.shell_interact()
    machine.send_key("ctrl-alt-f1")

    prepare_console_for_scrot()

    machine.send_chars("showconsolefont\n")

    check_golden_scrot("consoleFont.png", "consoleFontActual")

    restore_console_after_scrot()
