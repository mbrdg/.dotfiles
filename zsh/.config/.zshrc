# .zshrc
# zsh main configuration file

# options
setopt AUTO_CD
setopt CORRECT
setopt NOCLOBBER
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# prompt and vcs
autoload -U colors; colors
autoload -Uz add-zsh-hook vcs_info
setopt PROMPT_SUBST
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' nvcsformats '%~' # use the entire path for non-vcs folders
zstyle ':vcs_info:git:*' formats '%r/%S' '(%s:%b%F{magenta}%u%c%f)'
zstyle ':vcs_info:git:*' actionformats '%r/%S' '[%a] (%s:%b%F{magenta}%u%c%f)'
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:*:*' check-for-changes true

PROMPT='%(?.%F{green}■.%F{red}■)%f %n@%m %B%F{cyan}${vcs_info_msg_0_%/.}%f%b %# '
RPROMPT='$vcs_info_msg_1_'

# auto complete
fpath+=($(brew --prefix)/share/zsh/site-functions) # add brew shell completions
source <(fzf --zsh) # add fzf shell integration

autoload -U compinit; compinit
_comp_options+=(globdots)

# syntax highlighting
source $ZDOTDIR/plugins/fsh/fast-syntax-highlighting.plugin.zsh

# use brew's llvm toolchain instead of apple's toolchain
path=('/opt/homebrew/opt/llvm/bin' $path)
