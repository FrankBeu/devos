let
  server        = builtins.readFile ../../profiles/domain/server/testScript.py;
in
{
  testScript = ''
    ${server}
  '';
}
