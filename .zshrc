# Search for package that contains command if not found
source /usr/share/doc/pkgfile/command-not-found.zsh

# vi-like bindings
bindkey -v

# ssh into server
alias sshs='ssh -p 26 alex@alexozer.com -t "/home/alex/bin/tmx sirvo"'
# ssh into raspberry pi
alias sshp='ssh root@spacepi'

# tmux session handling
alias exit='[ -z "$TMUX" ] && exit || tmux detach'
alias logout='[ -z "$TMUX" ] && logout || tmux detach'

# Edit in vim as root
alias svim='sudo -E vim'

# Use rsync in place of cp to show progress
alias cp='rsync --progress'

# Use curl as wget
function wget() {
	curl -L "$1" -o "$(basename $1)"
}

# auto ls
function chpwd() {
    emulate -L zsh
    ls
}

# pacman shortcuts
alias paci="sudo pacman -S"
alias pacu="sudo pacman -Syu"
alias pacs="pacman -Ss"
alias pacq="pacman -Q"
alias pacqs="pacman -Qs"
alias pacql="pacman -Ql"
alias pacr="sudo pacman -Rsc"

# systemd shortcuts
alias sstart="sudo systemctl start"
alias sstop="sudo systemctl stop"
alias sres="sudo systemctl restart"
alias sen="sudo systemctl enable"
alias sdis="sudo systemctl disable"
alias srel="sudo systemctl daemon-reload"
