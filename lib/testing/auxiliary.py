import os.path
import re
from typing import List

def assert_contains(haystack: str, needle: str) -> None:
    if needle not in haystack:
        print("The haystack that will cause the following exception is:")
        print("---")
        print(haystack)
        print("---")
        raise Exception(f"Expected string '{needle}' was not found")


def assert_lacks(haystack: str, needle: str) -> None:
    if needle in haystack:
        print("The haystack that will cause the following exception is:")
        print("---")
        print(haystack, end="")
        print("---")
        raise Exception(f"Unexpected string '{needle}' was found")


def assert_contains_line(haystack: str, needle: str) -> None:
    '''
    Checks if the given needle is present in the haystack (assumed: ls-output).
    A needle has to be the only pattern on a line.
    Same as assert_contains except needle is surrounded by new-lines.
    '''
    line = f"\n{needle}\n"
    if line not in haystack:
        print("The haystack that will cause the following exception is:")
        print("---")
        print(haystack)
        print("---")
        raise Exception(f"Expected string '{needle}' was not found on own line")


def assert_contains_regex(haystack: str, needle_regex_string: str, multiline: bool=True) -> None:
    '''
    checks if the given regexString (e.g. r"google.com.\t[0-9]+\tIN\tA\t[0-9.]+")
    can be located in the haystack.
    Default: search in multiline-string; can be deactivated with "multi_line=False".
    '''
    if multiline:
        regex = re.compile(needle_regex_string, re.MULTILINE)
    else:
        regex = re.compile(needle_regex_string)

    if not regex.search(haystack):
        print("The haystack that will cause the following exception is:")
        print("---")
        print(haystack)
        print("---")
        raise Exception(f"Expected regex '{needle_regex_string}' was not found")


def assert_lacks_regex(haystack: str, needle_regex_string: str, multiline: bool=True) -> None:
    '''
    checks if the given regexString (e.g. r"google.com.\t[0-9]+\tIN\tA\t[0-9.]+")
    can NOT be located in the haystack.
    Default: search in multiline-string; can be deactivated with "multi_line=False"
    '''
    if multiline:
        regex = re.compile(needle_regex_string, re.MULTILINE)
    else:
        regex = re.compile(needle_regex_string)

    if regex.search(haystack):
        print("The haystack that will cause the following exception is:")
        print("---")
        print(haystack, end="")
        print("---")
        raise Exception(f"Unexpected string '{needle_regex_string}' was found")


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


def check_golden_scrot(file_name_golden: str, scrot_name_actual: str, debug=False) -> None:
    '''
    check_golden_scrot takes
    the name to a goldenFile, which has to be found in the machines's /tmp folder,
    a name for the actual scrot to compare,
    and optionally a debug-flag, because a screenshot will not be made available if the function fails.
    Both binary files get diffed.
    The golden file has to be imported seperately from devos: ...currentTest/golden/... to machine:/tmp
    TODO how to get TESTNAME / goldenPath: /tmp/TESTNAME/golden/{file_name_golden}
    TODO align extensions: both or none
    '''
    machine.sleep(1)
    machine.screenshot(scrot_name_actual)

    if not debug:
        filename_actual = os.path.join(_out_dir(), "{}.png".format(scrot_name_actual))
        machine.wait_for_file(filename_actual)
        machine.succeed(f"cmp /tmp/{file_name_golden} {filename_actual}")


def check_screen_text(command: str, assertions: List[str], debug=False) -> None:
    '''
    check_screen_text takes
    the command to be send to the shell,
    an array of string-assertions to test the output of the command against.
    and optionally a debug-flag, which enables logging the commandOutput
    '''
    prepare_console_for_scrot()

    machine.send_chars(f"{command}\n")
    machine.sleep(2)
    commandOutput = machine.get_screen_text()

    for assertion in assertions:
        assert_contains(commandOutput, assertion)

    if debug:
        machine.log(commandOutput)

    restore_console_after_scrot()


def _out_dir() -> str:
        out_dir = os.environ["out"]
        return out_dir

def ensure_dotLocal_header(filename: str, dotLocal_location: str) -> None:
        machine.log(f"FILENAME: {filename}")
        file_content = machine.succeed("cat " + os.path.join(dotLocal_location, filename))
        lines = file_content.split("\n", 18)

        for line_number in range(1, 19):
            line = lines[line_number - 1]
            if   line_number == 1:
                assert_contains_regex(line, r"^#!/usr/bin/env",                             multiline=False)
                # machine.log(print(line))
            elif line_number == 2:
                assert_contains_regex(line, r"^###$",                                       multiline=False)
            elif line_number == 3:
                assert_contains_regex(line, r"^### ---$",                                   multiline=False)
            elif line_number == 4:
                assert_contains_regex(line, r"^### name:$",                                 multiline=False)
            elif line_number == 5:
                assert_lacks_regex(   line, r"^###   \(file-\).*$",                         multiline=False)
            elif line_number == 6:
                assert_contains_regex(line, r"^### abstract:$",                             multiline=False)
            elif line_number == 7:
                assert_lacks_regex(   line, r"^###   \"FullNameWithUppercaseLettersFoundInTheAbbreviation: description\"$", multiline=False)
            elif line_number == 8:
                assert_contains_regex(line, r"^### usage: \|$",                             multiline=False)
            elif line_number == 9:
                assert_contains_regex(line, r"^###",                                        multiline=False)
            elif line_number == 10:
                assert_contains_regex(line, r"^###",                                        multiline=False)
            elif line_number == 11:
                assert_contains_regex(line, r"^### info: |$",                               multiline=False)
            elif line_number == 12:
                assert_lacks_regex(   line, r"^###    misc - URLs, references, man-pages$", multiline=False)
            elif line_number == 13:
                assert_contains_regex(line, r"^###",                                        multiline=False)
                assert_lacks_regex(   line, r"^### ---$",                                   multiline=False)
            elif line_number == 14:
                assert_contains_regex(line, r"^###",                                        multiline=False)
                assert_lacks_regex(   line, r"^### ---$",                                   multiline=False)
            elif line_number == 15:
                assert_contains_regex(line, r"^### ---$",                                   multiline=False)
            elif line_number == 16:
                assert_contains_regex(line, r"^###$",                                       multiline=False)
            elif line_number == 17:
                assert_lacks_regex(   line, r"^###",                                        multiline=False)
            else:
                break

            ### TODO requires python 3.10
            # match line_number:
            #     case 1:
            #         return ""
            #     case _:
                #         break

### TODO: make machine available via shell.nix: extra sources nixos-tests for lsp
