# mkdir then cd into it
mkcd() {
    mkdir -p "$1"
    cd "$1"
}

# Make 'help' a backup for 'man'
man () {
/usr/bin/man $@ || (help $@ 2> /dev/null && help $@ | less)
}

# unzip a python .egg file and make it
# a directory, loadable by python
unegg () {
    unzip $1 -d tmp
    rm $1
    mv tmp $1
}

# try to extract any archive file
extract() {
  echo "Extracting $1 ..."
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1  ;;
          *.tar.gz)    tar xzf $1  ;;
          *.bz2)       bunzip2 $1  ;;
          *.rar)       unrar x $1    ;;
          *.gz)        gunzip $1   ;;
          *.tar)       tar xf $1   ;;
          *.tbz2)      tar xjf $1  ;;
          *.tgz)       tar xzf $1  ;;
          *.zip)       unzip $1   ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1  ;;
          *)        echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
}

# gather external ip address
exip () {
    echo -n "Current External IP: "
    curl -s -m 5 http://myip.dk | grep "ha4" | sed -e 's/.*ha4">//g' -e 's/<\/span>.*//g'
}

# determine local IP address
ips () {
    ifconfig | grep "inet " | awk '{ print $2 }'
}

# generate a random password
random_password() {
    CHAR="[:alnum:]"
    env LC_CTYPE=C tr -dc "a-zA-Z0-9-_" < /dev/urandom | head -c ${1:-32}
    echo
}
# from the terminal "pw N" to generate an N-chr password
alias pw=random_password

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
