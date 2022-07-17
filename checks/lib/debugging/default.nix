{ lib }:
with lib;
let
  testDebuggingPrintContainer-mixed = {
    expr = debugging.printContainer (import ./printContainer );
    expected = ''
    {
    	list
    	set
    	}'';
  };

  testDebuggingPrintContainer-list = {
    expr = debugging.printContainer (import ./printContainer ).list;
    expected = ''
    [
    	test
    	testy
    	]'';
  };

  testDebuggingPrintContainer-set = {
    expr = debugging.printContainer (import ./printContainer ).set;
    expected = ''
    {
    	test
    	testy
    	}'';
  };

in
{
  inherit
  testDebuggingPrintContainer-mixed
  testDebuggingPrintContainer-list
  testDebuggingPrintContainer-set
  ;
}
