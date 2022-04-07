{ userID }:
let
  # lightdm = builtins.readFile ../../profiles/display/manager/lightdm/testScript.py; ### TODO
  i3        = (import ../../profiles/display/i3/testScript.py.nix { inherit userID;});
in
{
  testScript = ''
    ${i3}
  '';
}
