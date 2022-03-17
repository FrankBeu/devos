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
