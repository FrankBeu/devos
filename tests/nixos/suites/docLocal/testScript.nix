let
  documentation = builtins.readFile ../../profiles/services/documentation/testScript.py;
in
{
  testScript = ''
    ${documentation}
  '';
}
