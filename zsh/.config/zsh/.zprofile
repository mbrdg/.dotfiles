# Z profile, mbrdg

# Prevent duplicate entries in the PATH
typeset -U path

# Add brew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add programming toolchains to the path
. "$HOME/.cargo/env"
. "$HOME/.sdkman/bin/sdkman-init.sh"
eval "$(fnm env --use-on-cd)"

