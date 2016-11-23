set PATH /usr/local/bin /bin /usr/bin $PATH
set -U FZF_TMUX 1

function chpwd --on-variable PWD
  set -l cursor_pos (commandline --cursor)
  # Only show directory listing in interactive mode when not tab completing
  if test $cursor_pos -eq 0 ;and status --is-interactive
    ll
  end
end

# fish_update_completions
