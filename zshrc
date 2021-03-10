# https://github.com/sindresorhus/pure
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

# Bundle Exec
alias be="bundle exec"

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}"
	open "http://localhost:${port}/"
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}
