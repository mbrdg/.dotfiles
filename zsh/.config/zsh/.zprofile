# Z profile, mbrdg

# Add brew to the PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add fzf shell integration
eval "$(fzf --zsh)"

# Add programming toolchains to the path
. "$HOME/.cargo/env"
. "$HOME/.sdkman/bin/sdkman-init.sh"

