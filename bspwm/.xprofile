# environment variables

GOPATH1="$HOME/build/go"
GOPATH2="$HOME/code/auv/gocode"
export GOPATH="$GOPATH1:$GOPATH2"

GEM_BIN=$HOME/.gem/ruby/2.2.0/bin
export PATH="$PATH:$HOME/bin:$GOPATH1/bin:$GOPATH2/bin:$HOME/code/auv/link-stage:$GEM_BIN"
export PYTHONPATH="$HOME/code/auv"

# unlock keyrings for non-DE
if [ -n "$DESKTOP_SESSION" ]; then
	eval $(gnome-keyring-daemon --start)
	export SSH_AUTH_SOCK
fi
