# Main PATH var
export PATH=/usr/local/lib:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

# Adding additional items to the path
# these are all installed via mac homebrew
export PATH=/usr/local/lib/mongodb/bin:$PATH # mongo
export PATH=/usr/local/lib/node:$PATH # node
export PATH=/usr/local/Cellar/php/5.3.5/bin:$PATH # php
# commented out due to lack of use
export PATH=~/.my-zsh/tools:$PATH # custom scripts


# make the python repl better!
# export PYTHONSTARTUP=$HOME/.pythonrc.py
# kill creation of .pyc files
# export PYTHONDONTWRITEBYTECODE=1

# Java Home
[[ -s /usr/libexec/java_home ]] && export JAVA_HOME=$(/usr/libexec/java_home)
