{ lib }:
lib.makeExtensible (self:
let
  callLib = file: import file { inherit self lib; };
in rec
{
  colorscheme = callLib ./colorscheme;
  testing     = callLib ./testing;
})
