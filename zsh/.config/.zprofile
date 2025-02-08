# Z profile, runs for login shells
# mbrdg, 2025

# Prevent duplicate entries in the PATH
typeset -U path

# Add brew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add programming toolchains to the path
. "$HOME/.cargo/env"
. "$HOME/.sdkman/bin/sdkman-init.sh"
