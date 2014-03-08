autoload -U compinit promptinit colors
compinit
promptinit
colors

PROMPT="
%{$fg[red]%} »  %{$reset_color%}"
RPROMPT="%B%{$fg[blue]%}%~%{$reset_color%}"

[[ -t 1 ]] || return
case $TERM in
	*xterm*|*rxvt*|(dt|k|E|a)term)
		preexec () {
			print -Pn "\e]2;$1\a"    # edited; %n@%m omitted, as I know who and where I am
		}
		;;
esac

setopt AUTO_CD
setopt autopushd
setopt CORRECT
setopt completealiases
setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
export HISTFILE="${HOME}"/.zsh-history
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'
zstyle ':completion:*' menu select

bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey "^j" history-beginning-search-backward
bindkey "^k" history-beginning-search-forward

alias svim='sudo vim' 

#function open() { xdg-open $1 &> /dev/null &disown; }

conf() {
	case $1 in
		xmonad)		vim ~/.xmonad/xmonad.hs ;;
		conky)		vim ~/.conkyrc ;;
		pacman)		svim /etc/pacman.conf ;;
		ranger)		vim ~/.config/ranger/rc.conf ;;
		tmux)		vim ~/.tmux.conf ;;
		vim)		vim ~/.vimrc ;;
		xinit)		vim ~/.xprofile ;;
		xresources)	vim ~/.Xresources && xrdb ~/.Xresources ;;
		gtk2)		vim ~/.gtkrc-2.0 ;;
		gtk3)		vim ~/.config/gtk-3.0/settings.ini ;;
		tint2)		vim ~/.config/tint2/xmonad.tint2rc ;;
		zsh)		vim ~/.zshrc && source ~/.zshrc ;;
		termite)	vim ~/.config/termite/config ;;
		bspwm)		vim ~/.config/bspwm/bspwmrc ;;
		keys)		vim ~/.config/sxhkd/sxhkdrc ;;
		panel)		vim ~/bin/panel ;;
		bar)		
			cd ~/build/bar
			vim config.h
			make 
			sudo make clean install
			popd
			;;
		*)		echo "Unknown application: $1" ;;
	esac
}

# source custom colors:
#eval $(dircolors -b ${HOME}/.dir_colors)

alias dark="solarize dark"
alias light="solarize light"
alias flip="solarize flip"
alias sshs="ssh -p 26 alex@oroide.com"
alias sshm="sshfs -p 26 alex@oroide.com: ~/mnt/sirvo"

# Programs
alias installfont='sudo fc-cache -f -v'
alias muttb='mutt -F ~/.mutt/acct/wei001'
alias muttg='mutt -F ~/.mutt/acct/windelicato'
alias muttsuns='mutt -F ~/.mutt/acct/suns'
alias bool='espresso -o eqntott'
#alias compton='compton -cCfF -I 0.065 -O 0.065 -D 6' 
#alias compton='compton -cCGfF -o 0.38 -O 200 -I 200 -t 0.02 -l 0.02 -r 3.2 -D2 -m 0.88'
alias alsamixer="alsamixer -g"
alias equalizer="alsamixer -D equal"
alias htop="htop -C"

# Shortcuts
#alias rm='rm -i'
alias rmi='rm -i'
#alias mv='mv -i'
alias c='xsel -ib'
alias emac='emacs -nw'
alias h='history | tail'
alias ch='chmod 755 '
alias cdg='cd ~/code/go/src/github.com/alexozer'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ']'='open'
alias ll='ls -alF'
alias la='ls -A'
alias lla='ls -lA'
alias l='ls -CF'
alias vi='vim'

# tar aliases
alias tarzip='unzip'
alias tarx='tar -xvf'
alias targz='tar -zxvf'
alias tarbz2='tar -jxvf'

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#alias mkdir and cd
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
function cdl () { cd "$@" && ls; }

set -o noclobber
set -o vi
