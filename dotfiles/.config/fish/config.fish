# PATH additions
fish_add_path "/opt/homebrew/bin/"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/build/cross/bin"
fish_add_path "$HOME/build/roc/target/release"
fish_add_path "$HOME/go/bin"

# Configure Jump
status --is-interactive; and source (jump shell fish | psub)

# Install Starship
starship init fish | source

# Source secrets
test -f ~/.secrets.sh && source ~/.secrets.sh

# Auto LS on directory change
function __autols_hook --description "Auto ls" --on-event fish_prompt
  if test "$__autols_last" != (pwd) -a "$__autols_last" != ""
    ls
  end
  set  -g __autols_last (pwd)
end

# Aliases
alias cmd='cmd.exe /C'
alias prm='gh pr create --web'
alias pro='gh pr open --web'
alias m='make -j$(nproc)'
alias t='test -z "$TMUX" && tmux new-session -A -s main'
alias lg=lazygit
alias lzd=lazydocker
