import os.path

def assert_contains(haystack, needle) -> None:
    if needle not in haystack:
        print("The haystack that will cause the following exception is:")
        print("---")
        print(haystack)
        print("---")
        raise Exception(f"Expected string '{needle}' was not found")

def assert_lacks(haystack, needle) -> None:
    if needle in haystack:
        print("The haystack that will cause the following exception is:")
        print("---")
        print(haystack, end="")
        print("---")
        raise Exception(f"Unexpected string '{needle}' was found")


def prepare_console_for_scrot() -> None:
    '''
    1. sets PS{1,2} -> ''
    2. makes the cursor invisible and
    3. clears the screen
    '''
    machine.sleep(1)

    machine.send_chars("echo $PS1 > ./ps1\n")

    ### disable starship
    status, _ = machine.execute("test -f /etc/bashrc") ### bash return values
    bashrc_exists = not status
    if bashrc_exists:
        machine.send_chars("sed -i '/starship/ s/^/# /' /etc/bashrc\n")
        machine.send_chars("bash\n")

    ### set and backup prompts
    machine.send_chars("export PS1=''\n")
    machine.send_chars("export PS2=''\n")

    ### make cursor invisible
    machine.send_chars("tput civis\n")
    machine.send_chars("clear\n")
    machine.sleep(4) ### !!


def restore_console_after_scrot() -> None:
    '''
    restore the prompts and reset the terminal
    '''
    ### reset cursor
    machine.send_chars("tput reset\n")

    ### reenable starship
    status, _ = machine.execute("test -f /etc/bashrc") ### bash return values
    bashrc_exists = not status
    if bashrc_exists:
        machine.send_chars("sed -i '/starship/ s/# //' /etc/bashrc\n")

    ### restore prompt
    ### TODO: does not restore prompt
    machine.send_chars("bash\n")


def check_golden_scrot(file_name_golden, scrot_name_actual, debug=False) -> None:
    '''
    check_golden_scrot takes
    the name to a goldenFile, which has to be found in the machines's /tmp folder,
    a name for the actual scrot to compare,
    and optionaly a debug-flag, because a screenshot will not be made available if the function fails.
    Both binary files are diffed.
    The golden file has to be imported seperately from devos:...currentTest/golden/... to machine:/tmp
    '''
    machine.sleep(1)
    machine.screenshot(scrot_name_actual)

    if not debug:
        filename_actual = os.path.join(_out_dir(), "{}.png".format(scrot_name_actual))
        machine.succeed(f"cmp /tmp/{file_name_golden} {filename_actual}")


def _out_dir() -> str:
        out_dir = os.environ.get("out", os.getcwd())
        return out_dir


### TODO: make machine available via shell.nix: extra sources nixos-tests for lsp
