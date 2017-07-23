export ZSH=/home/alex/.oh-my-zsh
export TERM="xterm-256color"
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git extract gitignore history-substring-search vi-mode last-working-dir)

source $ZSH/oh-my-zsh.sh

# NB: gnome-terminal reports xterm-256color which is technically incorrect and
# behaves strangely with certain programs. Older versions of gnome-terminal set
# COLORTERM. Newer versions set VTE_VERSION
if [[ $VTE_VERSION -ge 3803 ]]; then
    # gnome-256color is equivalent to vte-256color
    export TERM=gnome-256color
fi

# if neovim is installed, use it
if hash nvim 2>/dev/null; then
	export EDITOR=nvim
else
	export EDITOR=vim
fi
alias vim=$EDITOR

# use sudo with vim
alias svim="sudo -E $EDITOR"

# use curl as wget
wget() {
	curl -L "$1" -o "$(basename $1)"
}

# auto ls
chpwd() {
    emulate -L zsh
    ls
}

# open file with default program
alias o='exo-open'

# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  echo 'from math import *\nimport cmath\n\n' |\
  vim - -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax |\
	norm G" "$@"
}

# matlab repl
alias matlab='matlab -nodesktop -nosplash'

# shortcuts to edit config files
e() {
    case "$1" in
	keys)
	    $EDITOR $HOME/.config/sxhkd/sxhkdrc
	    ;;
	zsh)
	    $EDITOR "$HOME/.zshrc"
	    source "$HOME/.zshrc"
	    ;;
	zshenv)
	    $EDITOR "$HOME/.zshenv"
	    ;;
	bspwm)
	    $EDITOR $HOME/.config/bspwm/bspwmrc
	    ;;
	vim)
	    $EDITOR $HOME/.vimrc
	    ;;
	startup)
	    $EDITOR $HOME/.config/bspwm/startup.sh
	    ;;
	env)
		$EDITOR $HOME/.profile
		;;
	ssh)
		$EDITOR $HOME/.ssh/config
		;;
	*)
	    echo "$1: invalid option"
	    return 1
	    ;;
    esac
}

# search command history
bindkey -M vicmd "j" history-substring-search-down
bindkey -M vicmd "k" history-substring-search-up
setopt HIST_IGNORE_ALL_DUPS

auv() {
	case "$1" in

	start)
		XAUTH_FILE="/var/lib/lxc/cuauv/rootfs/home/software/.Xauthority-host"
		sudo rm "$XAUTH_FILE"
		sudo touch "$XAUTH_FILE"
		xauth extract - $DISPLAY | sudo xauth -f "$XAUTH_FILE" merge $HOME/.Xauthority
		sudo chown --reference="$(dirname $XAUTH_FILE)" "$XAUTH_FILE"

		sudo systemctl start lxc@cuauv
		;;

	stop)
		sudo systemctl stop lxc@cuauv
		;;

	*)
		echo "Usage: auv [start|stop]"
		return 1
		;;
	esac
}

#export CUAUV_SOFTWARE="$HOME/code/auv/"
#auv() {
	#nix-shell "${CUAUV_SOFTWARE}nixos/configs/shell.nix" \
		#--indirect \
		#--add-root ~/.gcroots/dep \
		#--show-trace \
		#--pure \
		#--cores 0 \
		#--run "export CUAUV_SOFTWARE=\"$CUAUV_SOFTWARE\"; ${CUAUV_SOFTWARE}nixos/init.sh $SHELL"
#}

# OPAM configuration
. /home/alex/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# AUV

# Set envirnormental variables
export CUAUV_SOFTWARE="$HOME/code/auv/"
export CUAUV_LOG="/var/log/auv"
export PYTHONPATH="$PYTHONPATH:$CUAUV_SOFTWARE"
export CSC_OPTIONS="-L${CUAUV_SOFTWARE}link-stage -C -I${CUAUV_SOFTWARE} -I${CUAUV_SOFTWARE} -Wl,-rpath,${CUAUV_SOFTWARE}link-stage"
export CHICKEN_REPOSITORY=${CUAUV_SOFTWARE}link-stage/chicken
export GOPATH="${CUAUV_SOFTWARE}gocode"
export PATH="$PATH:${CUAUV_SOFTWARE}link-stage:${CUAUV_SOFTWARE}gocode/bin"
export CUAUV_CONTEXT="development"
export CUAUV_LOCALE="transdec"
export CUAUV_VEHICLE="artemis"

# Needed for building electrical on the sub
export AUV_SERIAL_OVERRIDE="auv-serial"

# Build the software repo
alias build="ninja -C "$CUAUV_SOFTWARE" -k 1000"
alias av="auv-visiond"

# Ensure anv-env-set is sourced
alias auv-env-set="source auv-env-set"

# Useful short aliases
alias t="trogdor"
alias c="auv-control-helm"
alias s="auv-shm-editor"
alias auv-mr="auv-mission-runner"
alias auv-pt="auv-pooltest"
alias aslam="auv-aslam-cli"
alias shm="auv-shm-cli"
alias cs="cd $CUAUV_SOFTWARE"
