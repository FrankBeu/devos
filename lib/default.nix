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
