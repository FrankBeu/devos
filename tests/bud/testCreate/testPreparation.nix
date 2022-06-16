{ budDir
, group
, self
, username
}:
{
  tmpfiles =
    ''
      C ${budDir}                        -    -           -        - ${self}
      Z ${budDir}                        0755 ${username} ${group} -
      L /tmp/golden/tests.bud.testCreate -    -           -        - ${./golden}
    ''; ### Z set mode recursively
}
