{
  ### TODO: integrate into lib.testing
  testPreparation = ''
    machine.copy_from_host("${./golden/consoleFont.png}", "/tmp/consoleFont.png")
  '';
}
