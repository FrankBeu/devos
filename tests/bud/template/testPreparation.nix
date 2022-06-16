{ budDir
, group
, self
, username
}:
{
  tmpfiles =
    ''
      C ${budDir}                          -    -           -        - ${self}
      Z ${budDir}                          0755 ${username} ${group} -
      L /tmp/golden/tests.bud.template     -    -           -        - ${./golden}
      d /home/${username}/tmp              0755 ${username} ${group} -
      d /home/${username}/tmp/dotLocal     0755 ${username} ${group} -
      d /home/${username}/tmp/dotLocal/clF 0755 ${username} ${group} -
      d /home/${username}/tmp/dotLocal/clT 0755 ${username} ${group} -
    ''; ### Z set mode recursively
}
