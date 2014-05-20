# Add completions if available...

if [ -d /usr/local/share/zsh/site-functions ]; then
fpath=(/usr/local/share/zsh/site-functions $fpath)
fi

if [ -d /usr/local/share/zsh-completions ]; then
fpath=(/usr/local/share/zsh-completions $fpath)
fi

# zsh performance tweaks
# .. take the first part of the path to be exact
zstyle ':completion:*' accept-exact '*(N)'
# .. use a cache file
zstyle ':completion:*' use-cache on
# .. and then specify the cache file to use (not added to repo: separate file for each machine)
zstyle ':completion:*' cache-path ~/.zshcache
