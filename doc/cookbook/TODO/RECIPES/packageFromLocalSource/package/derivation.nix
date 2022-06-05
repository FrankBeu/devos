{ writeShellScriptBin, ... }:

# This is eventually evaluated as mkDerivation, thus derivation
writeShellScriptBin "somebin" ''
  echo it works
''
