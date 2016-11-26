# Golang setting
set -gx GOROOT /usr/local/opt/go/libexec
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
set -gx PATH $GOROOT/bin $GOPATH/bin $PATH

# Perl Setting
set -gx PATH $HOME/.plenv/bin $PATH
#eval (plenv init -)
