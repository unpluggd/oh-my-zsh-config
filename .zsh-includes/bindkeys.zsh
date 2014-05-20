# fix keybindings on osx
# .. emacs bindings
# bindkey -e
# .. delete key
bindkey "^[[3~" delete-char
# .. shift-delete
bindkey "^[3;5~" delete-char
bindkey "^[[5C" backward-word
bindkey "^[[5C" forward-word
