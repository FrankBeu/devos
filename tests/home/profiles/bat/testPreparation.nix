{ group, username }:
{
  tmpfiles = ''
    d /tmp/tests.home.profiles.bat                                         0755 ${username} ${group} - -
    L /tmp/tests.home.profiles.bat/golden                                  0644 ${username} ${group} - ${./files/golden}
    L /tmp/tests.home.profiles.bat/testFileSource.battestsyntax            0644 ${username} ${group} - ${./files/testFileSource.battestsyntax}
  '';
}
