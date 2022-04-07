{ userID }:
let
  # lightdm = builtins.readFile ../../profiles/display/manager/gdm/testScript.py; ### TODO
  gnome        = (import ../../profiles/display/gnome/testScript.py.nix { inherit userID;});
in
{
  testScript = ''
    ${gnome}
  '';
}
