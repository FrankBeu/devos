machine.wait_for_unit("multi-user.target")

with subtest("==================================================================================================== Check if USER nixos exists"):
    assert "nixos" in machine.succeed(
    'getent passwd | grep nixos'
    ) 

with subtest("==================================================================================================== Check if USER root exists"):
    assert "root" in machine.succeed(
    'getent passwd | grep root'
    )
