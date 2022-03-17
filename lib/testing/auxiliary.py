def assert_contains(haystack, needle):
    if needle not in haystack:
        print("The haystack that will cause the following exception is:")
        print("---")
        print(haystack)
        print("---")
        raise Exception(f"Expected string '{needle}' was not found")

def assert_lacks(haystack, needle):
    if needle in haystack:
        print("The haystack that will cause the following exception is:")
        print("---")
        print(haystack, end="")
        print("---")
        raise Exception(f"Unexpected string '{needle}' was found")


def prepareConsoleForSCROT():
    '''
    prepareConsoleForScrot makes
    1. the consoleCursor invisible and
    2. clears the screen
    '''
    machine.send_chars("tput civis\n")
    machine.send_chars("clear\n")
    machine.sleep(1)


def checkGoldenSCROT(nameGolden, nameActual):
    '''
    checkGoldenSCROT takes
    the name to a goldenFile, which has to be found be found in the host's /tmp folder,
    a name for the actual scrot to compare,
    and diffs both binary files.
    The golden file has to be imported seperately from ./golden to /tmp TODO: integrate
    '''
    machine.sleep(1)
    machine.screenshot(nameActual)

    out_dir = os.environ.get("out", os.getcwd())
    filenameActual = os.path.join(out_dir, "{}.png".format(nameActual))
    machine.succeed(f"cmp /tmp/{nameGolden} {filenameActual}")
