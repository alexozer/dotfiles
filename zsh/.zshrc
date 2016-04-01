export ZSH=/home/alex/.oh-my-zsh
export TERM="xterm-256color"
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

source /usr/share/doc/pkgfile/command-not-found.zsh

plugins=(git extract gitignore history-substring-search vi-mode last-working-dir sudo)

source $ZSH/oh-my-zsh.sh

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

# python console calculator
alias calc='python3 -ic "from math import *; import cmath"'

# matlab repl
alias matlab='matlab -nodesktop -nosplash'

alias build='ninja -C $CUAUV_SOFTWARE'

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

hw() {
	hwCache="$HOME/.hw-cache"
	baseCmd() {
		gcalcli --calendar 'Homework#blue' --calendar 'Weekly Homework#cyan' --calendar 'Tests#magenta' --color_date=white $@
	}

	syncHw() {
		baseCmd calw 4 > "$hwCache"
	}

	if [ -z "$*" ]; then
		# make sure cache exists and is up-to-date
		if [ ! -f "$hwCache" ]; then
			syncHw
		else
			modDate="$(stat -c %y "$hwCache" | cut -d' ' -f1)"
			currDate="$(date +%Y-%m-%d)"
		 	if [ "$modDate" != "$currDate" ]; then
				syncHw
			fi
		fi

		cat "$hwCache"
		return
	fi

	firstArg="$1"
	shift
	case "$firstArg" in
	add)
		gcalcli --calendar Homework quick "$*"
		;;
	rm)
		baseCmd delete "$*"
		;;
	edit)
		baseCmd edit "$*"
		;;
	sync)
		echo -n "Syncing..."
		syncHw
		echo " done."
		cat "$hwCache"
		return
		;;
	*)
		echo "Invalid command: $firstArg"
		return
		;;
	esac

	syncHw
	cat "$hwCache"
}
