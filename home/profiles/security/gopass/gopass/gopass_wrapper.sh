#!/bin/sh

if [ -f ~/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
	source ~/.gpg-agent-info
	export GPG_AGENT_INFO
else
	eval $(gpg-agent --daemon)
fi

export GPG_TTY="$(tty)"

~/.nix-profile/bin/.gopass-jsonapi-wrapped listen

exit $?
