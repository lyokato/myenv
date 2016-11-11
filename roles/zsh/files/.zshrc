source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then

  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh themes/gallois

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions src
  zgen load zsh-users/zsh-history-substring-search

  zgen save
fi

autoload -Uz colors
colors

autoload -U compinit
compinit

setopt auto_cd
setopt correct
setopt auto_pushd
setopt pushd_ignore_dups

setopt histignorealldups
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

PATH=/bin:/usr/bin:/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:${PATH}
export PATH

alias ls='ls --color=auto'
eval "$(dircolors ~/.zsh/dircolors-solarized/dircolors.ansi-universal)"

if [ -n "$LS_COLORS" ]; then
     zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

chpwd() { ls -ltr --color=auto }

[ -e ~/.zshrc-after ] && source ~/.zshrc-after ]
