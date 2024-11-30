# Z profile, mbrdg

# Prevent duplicate entries in the PATH
typeset -U path

# Add brew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add programming toolchains to the path
. "$HOME/.cargo/env"
. "$HOME/.sdkman/bin/sdkman-init.sh"
eval "$(fnm env --use-on-cd)"


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
