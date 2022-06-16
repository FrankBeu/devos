let
  TODO = builtins.readFile  ../../profiles/TODO/testScript.py;
in
{
  testScript = ''
    ${TODO}
  '';
}
