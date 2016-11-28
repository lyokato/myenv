set -x PATH /usr/local/bin /bin /usr/bin $PATH
set -x FZF_TMUX 1
set -x EDITOR vim

function chpwd --on-variable PWD
  set -l cursor_pos (commandline --cursor)
  # Only show directory listing in interactive mode when not tab completing
  if test $cursor_pos -eq 0 ;and status --is-interactive
    ll
  end
end

 # This function borrowed from
 # http://zogovic.com/post/37906589287/showing-git-branch-in-fish-shell-prompt
set fish_git_dirty_color     red
set fish_git_not_dirty_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
    else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_right_prompt
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  if test -n "$git_dir"
    printf '[%s]' (parse_git_branch)
    else
    printf ''
  end
end

if not set -q LS_COLORS
  if type -q -f dircolors
    eval (dircolors -c ~/.config/fish/dircolors-solarized/dircolors.ansi-dark | sed 's/>&\/dev\/null$//')
  end
end

# fish_update_completions
#
if test -e ~/.config/fish/config-after.fish
  . ~/.config/fish/config-after.fish
end
