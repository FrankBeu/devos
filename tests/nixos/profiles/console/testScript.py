machine.wait_for_unit("multi-user.target")

with subtest("▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ Check if consoleFont is set"):
    prepare_console_for_scrot()

    machine.send_chars("showconsolefont\n")

    check_golden_scrot("consoleFontTarget.png", "consoleFontActual")

    restore_console_after_scrot()
