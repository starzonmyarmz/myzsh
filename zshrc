# https://github.com/sindresorhus/pure#manually
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -U compinit
compinit

# List all files colorized in long format, including dot files
alias la="ls -Gla"

# Show/hide hidden files in Finder
alias showdots="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder && echo 'Showing Hidden Files'"
alias hidedots="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder && echo 'Hiding Hidden Files'"

# Use VS Code for default editor
export EDITOR="code -w"
