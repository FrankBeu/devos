{ self, inputs, system, ...}:
let
  host = self.nixosConfigurations.NixOS;
in
{
  profilesTest = inputs.digga.lib.mkTest host ./testScript.nix;
}
