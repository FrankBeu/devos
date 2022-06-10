let
  bandwhich = builtins.readFile  ../../profiles/tools/bandwhich/testScript.py;
  exa       = builtins.readFile  ../../profiles/tools/exa/testScript.py;
  grex      = builtins.readFile  ../../profiles/tools/grex/testScript.py;
  hyperfine = builtins.readFile  ../../profiles/tools/hyperfine/testScript.py;
  procs     = builtins.readFile  ../../profiles/tools/procs/testScript.py;
  tokei     = builtins.readFile  ../../profiles/tools/tokei/testScript.py;
  zoxide    = builtins.readFile  ../../profiles/tools/zoxide/testScript.py;
in
{
  testScript = ''
    ${bandwhich}
    ${exa}
    ${grex}
    ${hyperfine}
    ${procs}
    ${tokei}
    ${zoxide}
  '';
}
