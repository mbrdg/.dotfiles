# Z profile, runs for login shells
# mbrdg, 2026

# Prevent duplicate entries in the PATH
typeset -U path

# Add brew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add programming toolchains to the path
path+=("$(brew --prefix rustup)/bin")
source "$HOME/.sdkman/bin/sdkman-init.sh"
