{ userID }:
let
  libvirtd    = (import            ../../profiles/virtualisation/libvirtd/testScript.py.nix { inherit userID;});
  virtmanager = builtins.readFile  ../../profiles/virtualisation/virtmanager/testScript.py;
in
{
  testScript = ''
    ${libvirtd}
    ${virtmanager}
  '';
}
