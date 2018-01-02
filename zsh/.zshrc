export TERM="xterm-256color"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle extract
antigen bundle gitignore
antigen bundle history-substring-search
antigen bundle vi-mode
antigen bundle last-working-dir
antigen theme robbyrussell

antigen apply

# NB: gnome-terminal reports xterm-256color which is technically incorrect and
# behaves strangely with certain programs. Older versions of gnome-terminal set
# COLORTERM. Newer versions set VTE_VERSION
if [[ $VTE_VERSION -ge 3803 ]]; then
    # gnome-256color is equivalent to vte-256color
    export TERM=gnome-256color
fi

export KEYTIMEOUT=1 # Don't pause much when entering normal mode

# Customize prompt

# Make most of prompt on left side
export MNML_PROMPT=(mnml_ssh mnml_pyenv mnml_status 'mnml_cwd 2 0' mnml_git mnml_keymap)
export MNML_RPROMPT=()
export MNML_MAGICENTER=()
export MNML_INFOLN=(mnml_err mnml_jobs mnml_uhp)

# Bold colors
export MNML_OK_COLOR='2;1'
export MNML_ERR_COLOR='1;1'
export MNML_CWD_COLOR='4;1'
export MNML_GIT_CLEAN_COLOR='1;1'
export MNML_GIT_DIRTY_COLOR='1;1'

# if neovim is installed, use it
if hash nvim 2>/dev/null; then
	export EDITOR=nvim
else
	export EDITOR=vim
fi
alias vim=$EDITOR

# use sudo with vim
alias svim="sudo -E $EDITOR"

# open file with default program
alias o='exo-open'

function chpwd {
	ls --color=always
}

# Codi
# Usage: codi [filetype] [filename]
function calc {
	local syntax="${1:-python}"
	echo 'from math import *\nimport cmath\n\n' |\
		vim - -c \
		"let g:startify_disable_at_vimenter = 1 |\
		set bt=nofile ls=0 noru nonu nornu |\
		hi ColorColumn ctermbg=NONE |\
		hi VertSplit ctermbg=NONE |\
		hi NonText ctermfg=0 |\
		Codi $syntax |\
		ALEDisable |\
		norm G" "$@"
}

# matlab repl
alias matlab='matlab -nodesktop -nosplash'

# shortcuts to edit config files
function e {
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
	bar)
		$EDITOR $HOME/.config/polybar/config
		;;
	*)
	    echo "$1: invalid option"
	    return 1
	    ;;
    esac
}

function stream() {
     INRES="1920x1080" # input resolution
     OUTRES="1920x1080" # output resolution
     FPS="15" # target FPS
	 GOP=$(($FPS * 2)) # i-frame interval, should be double of FPS, 
     GOPMIN="15" # min i-frame interval, should be equal to fps, 
     THREADS="2" # max 6
     CBR="2000k" # constant bitrate (should be between 1000k - 3000k)
     QUALITY="ultrafast"  # one of the many FFMPEG preset
     AUDIO_RATE="44100"
     STREAM_KEY="$1" # use the terminal command Streaming streamkeyhere to stream your video to twitch or justin
     SERVER="live-jfk" # twitch server in frankfurt, see http://bashtech.net/twitch/ingest.php for list
     
     ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :0.0 -f alsa -i pulse -f flv -ac 2 -ar $AUDIO_RATE \
       -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
       -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS -strict normal \
       -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
 }

# search command history
bindkey -M vicmd "j" history-substring-search-down
bindkey -M vicmd "k" history-substring-search-up
setopt HIST_IGNORE_ALL_DUPS

export CUAUV_SOFTWARE="$HOME/code/auv/"
alias cs='cd $CUAUV_SOFTWARE'

alias quartus="LD_LIBRARY_PATH=$HOME/build/altera/15.0/lib32 /home/alex/build/altera/15.0/quartus/bin/quartus --64bit& disown"

# OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
