# search for package that contains command if not found
source /usr/share/doc/pkgfile/command-not-found.zsh

# vi-like bindings
bindkey -v
bindkey -M vicmd v edit-command-line

# tmux session handling
alias exit='[ -z "$TMUX" ] && exit || tmux detach'
alias logout='[ -z "$TMUX" ] && logout || tmux detach'

# edit in vim as root
alias svim='sudo -E vim'

# use curl as wget
function wget() {
	curl -L "$1" -o "$(basename $1)"
}

# auto ls
function chpwd() {
    emulate -L zsh
    ls
}

# open current directory in file manager
alias fm="exo-open --launch FileManager"

# python console calculator
alias calc='python3 -ic "from math import *; import cmath"'
