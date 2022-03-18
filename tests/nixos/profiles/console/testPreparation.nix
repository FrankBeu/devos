{
  ### TODO: integrate into lib.testing after host-testing -> importable, composable tests; nix or py??
  testPreparation = ''
    machine.copy_from_host("${./golden/consoleFont.png}", "/tmp/consoleFont.png")
  '';
}
