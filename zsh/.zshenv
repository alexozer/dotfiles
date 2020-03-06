# Environment variables that I want to set outside interactive zsh sessions as well, and am ok with
# running on each zsh invocation. See ~/.zprofile for environment variable setup
# that I only want to run once at startup.

export TERMINAL

export GOPATH1="$HOME/build/go"
export GOPATH2="$HOME/code/go"
export GOPATH="$GOPATH1:$GOPATH2"
export npm_config_prefix=~/.node_modules

export PATH="$PATH:\
$HOME/bin:\
$GOPATH1/bin:\
$GOPATH2/bin:\
$npm_config_prefix/bin:\
$HOME/code/auv/link-stage:\
$HOME/.gem/ruby/2.4.0/bin:\
$HOME/.cargo/bin:\
$HOME/.npm-packages/bin:\
$HOME/.local/bin:\
/opt/n64/bin"

export _JAVA_AWT_WM_NONREPARENTING=1 # fix java guis
export MATLAB_JAVA="/usr/lib/jvm/java-8-openjdk/jre"

export QSYS_ROOTDIR="/home/alex/build/aur/tmp/yaourt-tmp-alex/aur-quartus-lite/pkg/quartus-lite//opt/altera/quartus/sopc_builder/bin"

export ALTERAOCLSDKROOT="/opt/altera/hld"

export MOZ_USE_XINPUT2=1 # Smooth scrolling in Firefox
export KRITA_HIDPI=ON

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export KEYTIMEOUT=1 # Don't pause much when entering normal mode
export CUAUV_SOFTWARE="$HOME/code/auv/"
export SDL_GAMECONTROLLERCONFIG="03000000790000004618000010010000,mayflash limited GameCube Controller Adapter,a:a3,b:b0,x:b2,y:b3,guide:b9,leftstick:a4,leftx:a0,lefty:a1,rightx:a5,righty:a2,lefttrigger:b4,righttrigger:b5,platform:Linux,"

export UNREAL_PATH=~/doc/projects/rolledout/UnrealEngine
export NumUBTBuildTasks="$(nproc)"

export SMB2TOOLS=~/doc/projects/romhack/util/smb2-tools/smb2-tools
export GHIDRA_INSTALL_DIR=~/build/ghidra_9.1.2_PUBLIC

# OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
