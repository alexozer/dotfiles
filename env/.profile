# environment variables

export GOPATH1="$HOME/build/go"
export GOPATH2="$HOME/code/go"
export GOPATH="$GOPATH1:$GOPATH2"
export NPM_PACKAGES="$HOME/.npm-packages"

export PATH="$PATH:\
$HOME/bin:\
$GOPATH1/bin:\
$GOPATH2/bin:\
$HOME/code/auv/link-stage:\
$HOME/.gem/ruby/2.4.0/bin:\
$HOME/.cargo/bin:\
$HOME/.npm-packages/bin:\
$HOME/.local/bin"

export _JAVA_AWT_WM_NONREPARENTING=1 # fix java guis
export MATLAB_JAVA="/usr/lib/jvm/java-8-openjdk/jre"

export QSYS_ROOTDIR="/home/alex/build/aur/tmp/yaourt-tmp-alex/aur-quartus-lite/pkg/quartus-lite//opt/altera/quartus/sopc_builder/bin"

export ALTERAOCLSDKROOT="/opt/altera/hld"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
