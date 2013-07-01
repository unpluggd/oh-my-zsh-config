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
#plugins=(osx brew git git-flow github svn node npm rvm pip taskwarrior)
# hiding some rarely used plugins for performance
plugins=(osx brew git git-flow github node npm)

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
# commented out due to lack of use
#export PATH=~/.rvm/gems/ruby-1.9.2-p136/bin:~/.rvm/gems/ruby-1.9.2-p136@global/bin:~/.rvm/rubies/ruby-1.9.2-p136/bin:~/.rvm/bin:$PATH
export PATH=~/.my-zsh/tools:$PATH # custom scripts

# Adding pythonbrew to the mix
export PYTHONBREW_ROOT=/usr/local/Library/pythonbrew
[[ -s /usr/local/Library/pythonbrew/etc/bashrc ]] && source /usr/local/Library/pythonbrew/etc/bashrc

# Make 'help' a backup for 'man'
man () {
/usr/bin/man $@ || (help $@ 2> /dev/null && help $@ | less)
}

# I use zc.buildout for all my python projects,
# so here are some helper methods which are aliased
# as commands below.

buildout_init() {
if [ -e bootstrap.py ]; then
    rm -f bootstrap.py
fi
wget http://downloads.buildout.org/2/bootstrap.py
}

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

# buildout commands
alias buildout=buildout_here
alias buildout-clean=buildout_clean
alias buildout-rebuild=buildout_rebuild
alias buildout-init=buildout_init

# mkdir then cd into it
mkcd() {
    mkdir -p "$1"
    cd "$1"
}
alias mkcd=mkcd

# generate a random password
random_password() {
    CHAR="[:alnum:]"
    env LC_CTYPE=C tr -dc "a-zA-Z0-9-_" < /dev/urandom | head -c ${1:-32}
    echo
}
# from the terminal "pw N" to generate an N-chr password
alias pw=random_password

# shortcut for downloading git repositories from our main git server
git_down() {
    cd ~/Projects
    git clone git@git.exstatik.com:$*.git
}
alias gitdown=git_down

# hide/show desktop icons on lion & re-launch TotalFinder
hide_desktop_icons() {
    defaults write com.apple.finder CreateDesktop -bool false
    killall Finder && open /Applications/TotalFinder.app
}
show_desktop_icons() {
    defaults write com.apple.finder CreateDesktop -bool true
    killall Finder && open /Applications/TotalFinder.app
}
alias hide-desktop-icons=hide_desktop_icons
alias show-desktop-icons=show_desktop_icons

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
alias mg="nocorrect mg"

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
# commented-out due to rare usage
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

source /usr/local/Library/pythonbrew/pythons/Python-2.7.2/bin/virtualenvwrapper.sh

# Java Home
export JAVA_HOME=$(/usr/libexec/java_home)

if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi
