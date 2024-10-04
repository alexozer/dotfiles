# Configure Jump
status --is-interactive; and source (jump shell fish | psub)

# Install Starship
starship init fish | source

# Auto LS on directory change
function __autols_hook --description "Auto ls" --on-event fish_prompt
  if test "$NO_AUTO_LS" != ""
    return
  end

  if test "$__autols_last" != (pwd)
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
