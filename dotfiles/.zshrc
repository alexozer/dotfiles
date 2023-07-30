# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.oh-my-zsh

HYPHEN_INSENSITIVE=true
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_UPDATE=true
plugins=(
  git
  pip
  command-not-found
  extract
  gitignore
)

export ZSH_THEME="powerlevel10k/powerlevel10k"

source "$ZSH"/oh-my-zsh.sh

export PATH="$PATH:$HOME/.local/bin"

export EDITOR=code
alias vim=$EDITOR
alias cmd='cmd.exe /C'
alias prm='gh pr create --web'
alias pro='gh pr open --web'
alias m='make -j'
alias t='[[ -z "$TMUX" ]] && tmux new-session -A -s main'

# Auto ls
function chpwd {
  ls --color=always
}

# Move contents of directory into current directory and delete original directory
function undir() {
  if [[ -z "$1" ]]; then
    echo "Usage: $0 [dir]"
    return 1
  fi

  if [[ ! -d "$1" ]]; then
    echo "Directory '$1' not found"
    return 1
  fi

  tmpRoot=~/.cache/undir
  mkdir -p "$tmpRoot"
  tmpDir="$(mktemp -d -p "$tmpRoot")"

  mv "$1"/*(D) "$tmpDir"
  rm -rf "$1"
  mv -i "$tmpDir"/*(D) .

  rm -rf "$tmpDir"
}

# Move contents of directory into new subdirectory
function redir() {
  if [[ -z "$1" ]]; then
    echo "Usage: $0 [dir]"
    return 1
  fi

  tmpRoot=~/.cache/undir
  mkdir -p "$tmpRoot"
  tmpDir="$(mktemp -d -p "$tmpRoot")"

  mv ./*(D) "$tmpDir"
  mv "$tmpDir" "$1"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f ~/.secrets.sh ]] || source ~/.secrets.sh

# pnpm
export PNPM_HOME="/home/alex/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s /home/alex/.autojump/etc/profile.d/autojump.sh ]] && source /home/alex/.autojump/etc/profile.d/autojump.sh
