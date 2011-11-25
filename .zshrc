# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set my custom theme to load.
# Remember to symlink! ./unpluggd.zsh-theme -> ~/.oh-my-zsh/themes/
export ZSH_THEME="unpluggd"

# Set this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Set this to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Set this if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx brew git git-flow github svn node npm rvm pip taskwarrior)

source $ZSH/oh-my-zsh.sh

# General tweaks
setopt AUTO_CD
setopt AUTO_PUSHD
setopt AUTO_NAME_DIRS
setopt GLOB_COMPLETE
setopt PUSHD_MINUS
# setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS
setopt RM_STAR_WAIT # wait 10s before deletes
setopt ZLE
setopt NO_FLOW_CONTROL # disables ctrl-s
setopt NO_CLOBBER
setopt NO_BEEP

# History tweaks
HISTFILE=~/.history
SAVEHIST=10000
HISTSIZE=10000

setopt APPEND_HISTORY # don't overwrite history; append instead
setopt INC_APPEND_HISTORY # append after each command
setopt SHARE_HISTORY # share history between shells
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# zsh performance tweaks
# .. take the first part of the path to be exact
zstyle ':completion:*' accept-exact '*(N)' 
# .. use a cache file
zstyle ':completion:*' use-cache on 
# .. and then specify the cache file to use (not added to repo: separate file for each machine)
zstyle ':completion:*' cache-path ~/.zshcache 

# Main PATH var
export PATH=/usr/local/lib:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

# Adding additional items to the path
# these are all installed via mac homebrew
export PATH=/usr/local/lib/mongodb/bin:$PATH # mongo
export PATH=/usr/local/lib/node:$PATH # node 
export PATH=/usr/local/Cellar/php/5.3.5/bin:$PATH # php
export PATH=~/.rvm/gems/ruby-1.9.2-p136/bin:~/.rvm/gems/ruby-1.9.2-p136@global/bin:~/.rvm/rubies/ruby-1.9.2-p136/bin:~/.rvm/bin:$PATH
export PATH=~/.my-zsh/tools:$PATH # custom scripts

# Adding pythonbrew to the mix
export PYTHONBREW_ROOT=/usr/local/Library/pythonbrew
[[ -s /usr/local/Library/pythonbrew/etc/bashrc ]] && source /usr/local/Library/pythonbrew/etc/bashrc

# I use zc.buildout for all my python projects,
# so here are some helper methods which are aliased
# as commands below.

buildout_here() {
if [ -e bootstrap.py ]; then
	print "$fg[yellow]Building...$fg[blue]"
	python bootstrap.py
	./bin/buildout
	print "$fg[green]...done."
else
	echo "ERROR: Unable to buildout from this directory; bootstrap.py does not exist."
fi
}

buildout_clean() {
if [ -e bootstrap.py ]; then
	print "$fg[yellow]Cleaning...$fg[red]"
	rm -Rfv -- eggs parts bin develop-eggs ./.installed.cfg
	find . -type f | grep -i \.pyc$ | xargs rm -fv
	print "$fg[green]...done."
else
	echo "ERROR: this does not appear to be a valid buildout directory"
fi
}

buildout_rebuild() {
if [ -e bootstrap.py ]; then
	buildout_clean
	buildout_here
else
	echo "ERROR: unable to complete; bootstrap.py does not exist."
fi
}

random_password() {
    CHAR="[:alnum:]"
    #cat /dev/urandom | tr -cd "$CHAR" | head -c ${1:-32}
    env LC_CTYPE=C tr -dc "a-zA-Z0-9-_" < /dev/urandom | head -c ${1:-32}
    echo
}

alias genpass=random_password
alias makepassword=random_password

# buildout commands
alias buildout=buildout_here 
alias buildout-clean=buildout_clean
alias buildout-rebuild=buildout_rebuild

# Custom alias commands
alias mk=popd
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias flushdns="dscacheutil -flushcache"
alias ttop="top -R -o cpu -s 2"
alias eject="drutil tray eject"
alias dl="aria2c -x2"

# fix annoying autocorrect errors
alias task="nocorrect task"
alias mono="nocorrect mono"
alias fop="nocorrect fop"

# fix keybindings on osx
# .. emacs bindings
# bindkey -e
# .. delete key
bindkey "^[[3~" delete-char
# .. shift-delete
bindkey "^[3;5~" delete-char
bindkey "^[[5C" backward-word
bindkey "^[[5C" forward-word 

# RVM: Ruby Version Manager
# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
