# PATH additions
fish_add_path "/opt/homebrew/bin/"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/build/cross/bin"
fish_add_path "$HOME/build/roc/target/release"
fish_add_path "$HOME/go/bin"
fish_add_path "/opt/devkitpro/devkitPPC/bin"

# More environment variables
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC
export FZF_DEFAULT_OPTS="--layout=reverse"

# Aliases
alias cmd='cmd.exe /C'
alias prm='gh pr create --web'
alias pro='gh pr open --web'
alias m='make -j$(nproc)'
alias t='test -z "$TMUX" && tmux new-session -A -s main'
alias lg=lazygit
alias lzd=lazydocker
alias ssh='TERM=xterm-256color /usr/bin/ssh'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias vim=nvim

# Source secrets
test -f ~/.secrets.sh && source ~/.secrets.sh

# Auto LS on directory change
function __autols_hook --description "Auto ls" --on-event fish_prompt
  if test "$__autols_last" != (pwd) -a "$__autols_last" != ""
    ls
  end
  set  -g __autols_last (pwd)
end

# Configure fzf (sorry, I don't like fish's Ctrl+R)
fzf --fish | source

# Install Starship
starship init fish | source

# Configure zoxide
zoxide init fish --cmd j | source
