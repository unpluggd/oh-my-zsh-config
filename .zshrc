# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="unpluggd"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx brew git github)

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


# Customize to your needs...
export PATH=/usr/local/lib/node:/usr/local/sbin:/usr/local/bin:~/.rvm/gems/ruby-1.9.2-p136/bin:~/.rvm/gems/ruby-1.9.2-p136@global/bin:~/.rvm/rubies/ruby-1.9.2-p136/bin:~/.rvm/bin:/Library/Frameworks/Python.framework/Versions/Current/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

# Adding python bin path to PATH
export PATH=/usr/local/Cellar/python/2.7.1/bin:$PATH

# Custom alias commands
alias mk=popd

alias buildout="echo 'Building...'; python `pwd`/bootstrap.py; `pwd`/bin/buildout; echo '...done.'"
alias buildout-clean="echo 'Cleaning up...'; rm -Rfv `pwd`/{eggs,parts,bin,develop-eggs}; rm -fv `pwd`/.installed.cfg; find `pwd` -type f | grep -i \.pyc$ | xargs rm -fv; echo '...done.'"
alias buildout-rebuild="echo 'Cleaning up...'; rm -Rfv `pwd`/{eggs,parts,bin,develop-eggs}; rm -fv `pwd`/.installed.cfg; find `pwd` -type f | grep -i \.pyc$ | xargs rm -fv; echo '...rebuilding...'; python `pwd`/bootstrap.py; `pwd`/bin/buildout; echo '...done.'"
alias buildout-foo="echo $(pwd)"

alias updatedb="sudo /usr/libexec/locate.updatedb"

alias flushdns="dscacheutil -flushcache"

# RVM: Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
