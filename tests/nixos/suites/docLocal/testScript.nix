let
  documentation = builtins.readFile ../../profiles/services/documentation/testScript.py;
  domainLocal   = builtins.readFile ../../profiles/domain/local/testScript.py;
  server        = builtins.readFile ../../profiles/domain/server/testScript.py;
in
{
  testScript = ''
    ${documentation}
    ${domainLocal}
    ${server}
  '';
}
