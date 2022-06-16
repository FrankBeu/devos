{ budDir
, group
, self
, username
}:
{
  tmpfiles =
    ''
      C ${budDir} -    -           -        - ${self}
      Z ${budDir} 0755 ${username} ${group} -
    ''; ### Z set mode recursively
}
