{ group, username }:
let content = ''\x23\x21/usr/bin/env\x20zsh\x0a\x0atouch\x20\x7e/actionButtonTestSuccess\x0a''; in ### systemd-escape
{
  tmpfiles = ''
    f /home/${username}/.config/actionButton/i.zsh    0644 ${username} ${group} - ${content}
  '';
}
