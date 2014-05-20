# Useful python aliases:
# serve all files in the current directory
alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
# print the python path
alias pypath='python -c "import sys; print sys.path" | tr "," "\n" | grep -v "egg"'
# recursively delete all .pyc files
alias pycclean='find . -name "*.pyc" -exec rm {} \;'


alias mk=popd

# update the search database
alias updatedb="sudo /usr/libexec/locate.updatedb"

# flush dns cache
alias flushdns="dscacheutil -flushcache"

# better native top
alias ttop="top -R -o cpu -s 2"

# force cd eject
alias eject="drutil tray eject"

# download a file with aria2c using multiple streams
alias dl="aria2c -x2"

alias htop="sudo htop"
alias iftop="sudo iftop"

# fix annoying autocorrect errors
alias task="nocorrect task"
alias mono="nocorrect mono"
alias fop="nocorrect fop"
alias mg="nocorrect mg"

# allow using homeshick from zsh
alias homeshick="$HOME/.homesick/repos/homeshick/home/.homeshick"

# Always highlight grep search term
alias grep='grep --color=auto'

# Pings with 5 packets, not unlimited
alias ping='ping -c 5'

# Disk free, in gigabytes, not bytes
alias df='df -h'

# Calculate total disk usage for a folder
alias du='du -h -c'
