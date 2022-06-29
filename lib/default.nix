{ lib }:
lib.makeExtensible (self:
let
  callLib = file: import file { inherit self lib; };
in rec
{
  colorscheme = callLib ./colorscheme;
  debugging   = callLib ./debugging;
  testing     = callLib ./testing;
})
### TODO doc
### TODO check how TTD can be implemented
### write tests
### access like lib.our.debug.printContainer
### { lib.our = self.lib; } nixos/default.nix
