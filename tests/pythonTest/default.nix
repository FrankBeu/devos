{ inputs, system }:
{
  pythonTest =
    with import (inputs.latest + "/nixos/lib/testing-python.nix") {inherit system; };
    makeTest {
      nodes = {
        client = { ... }: {
          # imports = [ self.nixosModules.dwarffs ];
          # nixpkgs.overlays = [ nix.overlay ];
        };
      };

      testScript =
        ''
          start_all()
          client.wait_for_unit("multi-user.target")
          client.screenshot("postboot")
        '';
        # client.succeed("dwarffs --version")
        # client.succeed("cat /run/dwarffs/README")
        # client.succeed("[ -e /run/dwarffs/.build-id/00 ]")
    };

}
