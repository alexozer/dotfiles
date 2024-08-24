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

export PATH="$PATH:$HOME/.local/bin:$HOME/build/cross/bin"
export EDITOR=vim

alias cmd='cmd.exe /C'
alias prm='gh pr create --web'
alias pro='gh pr open --web'
alias m='make -j'
alias t='[[ -z "$TMUX" ]] && tmux new-session -A -s main'
alias lg=lazygit
alias lzd=lazydocker

# Auto ls
function chpwd {
  ls --color=always
}

[[ ! -f ~/.secrets.sh ]] || source ~/.secrets.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/home/alex/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -f ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
[[ -f /opt/homebrew/etc/profile.d/autojump.sh ]] && . /opt/homebrew/etc/profile.d/autojump.sh
# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"
export LLVM_SYS_160_PREFIX=$(brew --prefix llvm@16)

export PATH="$PATH":$HOME/build/roc/target/release
export PATH="$PATH":$HOME/go/bin
# bun completions
[ -s "/Users/alex/.bun/_bun" ] && source "/Users/alex/.bun/_bun"
