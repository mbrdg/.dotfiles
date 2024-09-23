# .zshrc
# zsh main configuration file

# options
setopt AUTO_CD
setopt CORRECT
setopt NOCLOBBER
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS

# prompt and vcs
autoload -U colors; colors
autoload -Uz add-zsh-hook vcs_info
setopt PROMPT_SUBST
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '(git:%b%F{magenta}%u%c%f)'
zstyle ':vcs_info:git*' unstagedstr '*'
zstyle ':vcs_info:git*' stagedstr '+'
zstyle ':vcs_info:*:*' check-for-changes true

PROMPT='%(?.%F{green}✓.%F{red}✗)%f %n@%m %B%F{cyan}%2~%f%b %# '
RPROMPT='$vcs_info_msg_0_'

# auto complete
fpath+=($(brew --prefix)/share/zsh/site-functions) # add brew shell completions
eval "$(fzf --zsh)" # add fzf shell integration

autoload -U compinit; compinit
_comp_options+=(globdots)

# syntax highlighting
source $ZDOTDIR/plugins/fsh/fast-syntax-highlighting.plugin.zsh

