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

# Customize to your needs...
export PATH=/usr/local/lib/node:/usr/local/sbin:/usr/local/bin:/Users/phillipoldham/.rvm/gems/ruby-1.9.2-p136/bin:/Users/phillipoldham/.rvm/gems/ruby-1.9.2-p136@global/bin:/Users/phillipoldham/.rvm/rubies/ruby-1.9.2-p136/bin:/Users/phillipoldham/.rvm/bin:/Library/Frameworks/Python.framework/Versions/Current/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

# Adding python bin path to PATH
export PATH=/usr/local/Cellar/python/2.7.1/bin:$PATH

# Custom alias commands
alias buildout="echo 'Building...'; python `pwd`/bootstrap.py; `pwd`/bin/buildout; echo '...done.'"
alias buildout-clean="echo 'Cleaning up...'; rm -Rf `pwd`/{eggs,parts,bin,develop-eggs}; rm -f `pwd`/.installed.cfg; find `pwd` -type f | grep -i \.pyc$ | xargs rm -f; echo '...done.'"
alias buildout-rebuild="echo 'Cleaning up...'; rm -Rf `pwd`/{eggs,parts,bin,develop-eggs}; rm -f `pwd`/.installed.cfg; find `pwd` -type f | grep -i \.pyc$ | xargs rm -f; echo '...rebuilding...'; python `pwd`/bootstrap.py; `pwd`/bin/buildout; echo '...done.'"

alias updatedb="sudo /usr/libexec/locate.updatedb"

alias flushdns="dscacheutil -flushcache"

# RVM: Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
