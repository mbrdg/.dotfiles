# .zshrc
# zsh main configuration file

# options
setopt AUTO_CD
setopt EXTENDED_HISTORY

# pure prompt
fpath+=($ZDOTDIR/plugins/pure)
autoload -U promptinit; promptinit
prompt pure

# auto complete
autoload -U compinit; compinit
_comp_options+=(globdots)

# syntax highlighting
source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

